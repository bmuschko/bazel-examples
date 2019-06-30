def _war_impl(ctx):
  zipper = ctx.file._zipper
  war = ctx.outputs.war
  build_output = war.path + ".build_output"
 
  cmd = "rm -rf %s\n" % build_output
  cmd += "mkdir -p %s\n" % build_output
  cmd += "cp %s %s\n" % (" ".join([src.path for src in ctx.files.srcs]), build_output)
  
  cmd += "find %s -name '*.txt' | sed 's:^%s/::' > %s/class_list\n" % (
      build_output,
      build_output,
      build_output,
  )

  cmd += "root=`pwd`\n"
  cmd += "cd %s\n" % build_output
  cmd += "zip ../%s new.txt web.xml\n" % war.basename

  print(cmd)

  ctx.actions.run_shell(
      inputs = ctx.files.srcs,
      outputs = [war],
      mnemonic = "WAR",
      command = "set -e;" + cmd,
      use_default_shell_env = True,
  )

war = rule(
    _war_impl,
    attrs = {
        "srcs": attr.label_list(allow_files=True),
        "_zipper": attr.label(
            default = Label("@bazel_tools//tools/zip:zipper"),
            executable = True,
            allow_single_file = True,
            cfg = "host",
        ),
    },
    outputs = {
        "war" : "%{name}.war"
    },
)

def java_war(name, **kwargs):
    native.java_library(
        name = "lib%s" % name,
        **kwargs
    )

    war(
        name = name,
        srcs = native.glob(["resources/**/*.*"]),
    )