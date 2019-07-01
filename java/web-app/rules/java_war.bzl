def _war_impl(ctx):
    web_app_root = ctx.attr.web_app_root
    web_app_srcs = ctx.files.web_app_srcs
    war = ctx.outputs.war

    zipper_args = ["c", war.path]

    for src in web_app_srcs:
        name = src.path.lstrip(web_app_root) + "=" + src.path
        zipper_args.append(name)

    runtime_deps = []

    for this_dep in ctx.attr.deps:
        if JavaInfo in this_dep:
            runtime_deps += this_dep[JavaInfo].transitive_runtime_jars.to_list()

    for runtime_dep in runtime_deps:
        name = "WEB-INF/lib/" + runtime_dep.basename + "=" + runtime_dep.path
        zipper_args.append(name)

    ctx.actions.run(
        inputs = web_app_srcs + runtime_deps,
        outputs = [war],
        executable = ctx.executable._zipper,
        arguments = zipper_args,
        progress_message = "Creating war...",
        mnemonic = "war",
    )

war = rule(
    _war_impl,
    attrs = {
        "web_app_root": attr.string(),
        "web_app_srcs": attr.label_list(
            allow_files = True
        ),
        "deps": attr.label_list(),
        "_zipper": attr.label(
            default = Label("@bazel_tools//tools/zip:zipper"),
            executable = True,
            cfg = "host",
        ),
    },
    outputs = {
        "war" : "%{name}.war"
    },
)

def java_war(name, web_app_dir, deps = [], **kwargs):
    native.java_library(
        name = "lib%s" % name,
        **kwargs
    )

    war(
        name = name,
        web_app_root = web_app_dir,
        web_app_srcs = native.glob([web_app_dir + "/**/*.*"]),
        deps = deps + [":lib%s" % name]
    )