def _impl(ctx):
  zip_input = ctx.label.name
  zip_output = ctx.outputs.zip
  src_list = []
  for src in ctx.files.srcs:
    src_list += [src.path]
  cmd = [
      "mkdir %s" % zip_input,
      "javadoc -quiet -d %s %s" % (zip_input, " ".join(src_list)),
      "zip -q -r %s %s/*" % (zip_output.path, zip_input)]
  ctx.action(
      inputs = ctx.files.srcs,
      outputs = [zip_output],
      command = "\n".join(cmd))


javadoc = rule(
    attrs = {
        "srcs" : attr.label_list(allow_files = True)
    },
    implementation = _impl,
    outputs = {"zip" : "%{name}.zip"},
)