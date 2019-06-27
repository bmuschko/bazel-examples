load("@io_bazel_rules_groovy//groovy:groovy.bzl", "groovy_binary", "groovy_library", "groovy_test")

groovy_library(
    name = "prodlib",
    srcs = glob(["src/main/groovy/**/*.groovy"]),
)

groovy_binary(
    name = "hello-world",
    srcs = glob(["src/main/groovy/**/*.groovy"]),
    main_class = "com.bmuschko.HelloWorld",
    deps = [":prodlib"],
)

groovy_library(
    name = "testlib",
    srcs = glob(["src/test/groovy/**/*.groovy"]),
    deps = [":prodlib"],
)

groovy_test(
    name = "tests",
    srcs = ["src/test/groovy/com/bmuschko/messenger/MessengerTest.groovy"],
    deps = [":testlib"],
)