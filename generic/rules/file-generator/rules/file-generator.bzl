def _file_generator_impl(ctx):
    number = ctx.attr.number
    outputs = []

    for n in range(1, number + 1):
        output_file = ctx.actions.declare_file("content-%s.txt" % n)
        outputs.append(output_file)

        ctx.actions.write(
            output = output_file,
            content = "hello world %s" % n,
        )

    return [DefaultInfo(files = depset(outputs))]

file_generator = rule(
    implementation = _file_generator_impl,
    doc = """
Generate the number of files provided by an input and populates them with text.
""",
    attrs = {
        "number": attr.int(default = 10),
    },
)