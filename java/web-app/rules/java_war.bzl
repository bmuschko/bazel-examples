def _war_impl(ctx):
  war = ctx.outputs.war

  zipper_args = ["c", war.path]

  for src in ctx.files.srcs:
    name = src.path + "=" + src.path
    zipper_args.append(name)

  ctx.actions.run(
      inputs = ctx.files.srcs,
      outputs = [war],
      executable = ctx.executable._zipper,
      arguments = zipper_args,
      progress_message = "Creating war...",
      mnemonic = "war",
  )

war = rule(
    _war_impl,
    attrs = {
        "srcs": attr.label_list(allow_files=True),
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

def java_war(name, srcs = [], **kwargs):
    native.java_library(
        name = "lib%s" % name,
        **kwargs
    )

    war(
        name = name,
        srcs = srcs,
    )