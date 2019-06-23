load("@io_bazel_rules_docker//java:image.bzl", "java_image")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")

java_image(
    name = "docker-image",
    srcs = glob(["src/main/java/**/*.java"]),
    main_class = "com.bmuschko.Application",
    deps = [
        "@maven//:org_springframework_boot_spring_boot",
        "@maven//:org_springframework_boot_spring_boot_starter_web",
        "@maven//:org_springframework_boot_spring_boot_autoconfigure",
        "@maven//:org_springframework_spring_web",
    ],
)

container_image(
    name = "app-image",
    base = ":docker-image",
    ports = ["8080"],
    directory = "/app",
    workdir = "/app",
)