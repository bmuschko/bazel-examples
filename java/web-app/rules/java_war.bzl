def _war_impl(ctx):
    web_app_root = ctx.attr.web_app_root
    web_app_srcs = ctx.files.web_app_srcs
    war = ctx.outputs.war

    zipper_args = ["c", war.path]

    for src in web_app_srcs:
        name = src.path.lstrip(web_app_root) + "=" + src.path
        zipper_args.append(name)

    ctx.actions.run(
        inputs = web_app_srcs,
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

def java_war(name, web_app_dir, **kwargs):
    native.java_library(
        name = "lib%s" % name,
        **kwargs
    )

    war(
        name = name,
        web_app_root = web_app_dir,
        web_app_srcs = native.glob([web_app_dir + "/**/*.*"]),
    )