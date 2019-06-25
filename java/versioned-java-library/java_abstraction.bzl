def versioned_java_library(name, srcs, version, deps = [], visibility = None):
  native.java_library(
      name = "versioned-%s" % name,
      srcs = srcs,
      deps = deps,
      visibility = visibility
  )
  native.genrule(
      name = "versioned-%s" % name,
      srcs = ["lib%s.jar" % name],
      outs = ["%s-%s.jar" % (name, version)],
      cmd = "cp $< $@",
)