_TEMPLATE = "//:message-template.txt"

def _templater_impl(ctx):
    ctx.actions.expand_template(
        template = ctx.file._template,
        output = ctx.outputs.source_file,
        substitutions = {
            "{FIRSTNAME}": ctx.attr.firstname,
            "{LASTNAME}": ctx.attr.lastname,
        },
    )

templater = rule(
    implementation = _templater_impl,
    doc = """
Generates a text file from a template and replaces variables at runtime.
""",
    attrs = {
        "firstname": attr.string(mandatory = True),
        "lastname": attr.string(mandatory = True),
        "_template": attr.label(
            default = Label(_TEMPLATE),
            allow_single_file = True,
        ),
    },
    outputs = {"source_file": "%{name}.generated"},
)