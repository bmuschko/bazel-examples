java_library(
    name = "lib",
    srcs = glob(["src/main/java/**/*.java"]),
    deps = [
        "@maven//:commons_lang_commons_lang",
    ],
)

java_binary(
    name = "app",
    main_class = "com.bmuschko.HelloWorld",
    runtime_deps = [
        ":lib",
    ]
)

# For more information, see https://github.com/junit-team/junit5-samples/tree/master/junit5-jupiter-starter-bazel
load("//:junit5.bzl", "java_junit5_test")

java_junit5_test(
    name = "junit5-test",
    srcs = [
        "src/test/java/com/bmuschko/messenger/MessengerTest.java"
    ],
    test_package = "com.bmuschko.messenger",
    deps = [
        ":lib",
    ],
)