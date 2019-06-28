load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library", "go_test")

IMPORT_PATH = "github.com/bmuschko/hello-world"

go_library(
    name = "go_default_library",
    srcs = [
        "main.go",
        "msg.go",
    ],
    importpath = IMPORT_PATH,
    visibility = ["//visibility:private"],
)

go_binary(
    name = "hello-world",
    embed = [":go_default_library"],
    visibility = ["//visibility:public"],
)

go_test(
    name = "tests",
    srcs = ["msg_test.go"],
    embed = [":go_default_library"],
)