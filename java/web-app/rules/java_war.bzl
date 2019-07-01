def _add_web_app_srcs_args(zipper_args, web_app_root, web_app_srcs):
    for src in web_app_srcs:
        name = src.path.lstrip(web_app_root) + "=" + src.path
        zipper_args.append(name)

def _collect_runtime_deps(deps):
    runtime_deps = []

    for this_dep in deps:
        if JavaInfo in this_dep:
            runtime_deps += this_dep[JavaInfo].transitive_runtime_jars.to_list()

    return runtime_deps

def _add_runtime_deps_args(zipper_args, runtime_deps):
    for runtime_dep in runtime_deps:
        name = "WEB-INF/lib/" + runtime_dep.basename + "=" + runtime_dep.path
        zipper_args.append(name)

def _war_impl(ctx):
    web_app_root = ctx.attr.web_app_root
    web_app_srcs = ctx.files.web_app_srcs
    deps = ctx.attr.deps
    zipper = ctx.executable._zipper
    war = ctx.outputs.war

    zipper_args = ["c", war.path]
    _add_web_app_srcs_args(zipper_args, web_app_root, web_app_srcs)
    runtime_deps = _collect_runtime_deps(deps)
    _add_runtime_deps_args(zipper_args, runtime_deps)

    ctx.actions.run(
        inputs = web_app_srcs + runtime_deps,
        outputs = [war],
        executable = zipper,
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

def java_war(name, web_app_dir = "src/main/webapp", srcs = [], deps = [], **kwargs):
    native.java_library(
        name = "lib%s" % name,
        srcs = srcs,
        deps = deps,
        **kwargs
    )

    war(
        name = name,
        web_app_root = web_app_dir,
        web_app_srcs = native.glob([web_app_dir + "/**/*.*"]),
        deps = [":lib%s" % name]
    )