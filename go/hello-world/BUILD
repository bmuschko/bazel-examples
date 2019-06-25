load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

go_library(
    name = "go_default_library",
    srcs = [
        "main.go",
        "msg.go",
    ],
    importpath = "github.com/bmuschko/hello-world",
)

go_binary(
    name = "hello-world",
    srcs = [
        "main.go",
        "msg.go",
    ],
    deps = [":go_default_library"],
)