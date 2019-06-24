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

load("//:jacoco.bzl", "java_jacoco_test")

java_jacoco_test(
    name = "all-tests",
    srcs = [
        "src/test/java/com/bmuschko/AllTests.java",
        "src/test/java/com/bmuschko/messenger/MessengerTest.java"
    ],
    test_class = "com.bmuschko.AllTests",
    jacoco_dep = "@maven//:org_jacoco_org_jacoco_agent_runtime",
    deps = [
        ":lib",
         "@maven//:junit_junit",
         "@maven//:org_jacoco_org_jacoco_agent_runtime",
    ],
)