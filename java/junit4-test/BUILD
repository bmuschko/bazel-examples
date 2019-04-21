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

java_test(
    name = "all-tests",
    srcs = [
        "src/test/java/com/bmuschko/AllTests.java",
        "src/test/java/com/bmuschko/messenger/MessengerTest.java"
    ],
    test_class = "com.bmuschko.AllTests",
    deps = [
        ":lib",
         "@maven//:junit_junit",
    ],
)