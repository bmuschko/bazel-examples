def _empty_impl(ctx):
    print("This rule does nothing")

empty = rule(
    implementation = _empty_impl,
    doc = """
Minimalist example of a rule that does nothing.
""",
)