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

load("@bazel_common//tools/maven:pom_file.bzl", "pom_file")

pom_file(
    name = "pom",
    targets = [
        "//:lib",
    ],
    template_file = "pom_template.xml",
)