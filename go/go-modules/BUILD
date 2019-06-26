load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library", "go_test")

IMPORT_PATH = "github.com/bmuschko/hello-world"

go_library(
    name = "go_default_library",
    srcs = [
        "main.go",
        "msg.go",
    ],
    importpath = "github.com/bmuschko/hello-world",
    visibility = ["//visibility:private"],
)

go_binary(
    name = "hello-world",
    embed = [":go_default_library"],
    visibility = ["//visibility:public"],
)

load("@bazel_gazelle//:def.bzl", "gazelle")

# gazelle:prefix github.com/bmuschko/hello-world
gazelle(name = "gazelle")

go_test(
    name = "go_default_test",
    srcs = ["msg_test.go"],
    embed = [":go_default_library"],
    deps = ["@com_github_stretchr_testify//assert:go_default_library"],
)
