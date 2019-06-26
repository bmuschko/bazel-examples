load("@io_bazel_rules_groovy//groovy:groovy.bzl", "groovy_binary", "groovy_library", "groovy_test")

groovy_binary(
    name = "hello-world",
    srcs = glob(["src/main/groovy/com/bmuschko/**/*.groovy"]),
    main_class = "com.bmuschko.HelloWorld"
)

groovy_library(
  name = "testlib",
  srcs = glob(["**/*.groovy"]),
)

groovy_test(
    name = "tests",
    srcs = ["src/test/groovy/com/bmuschko/messenger/MessengerTest.groovy"],
    deps = [":testlib"],
)