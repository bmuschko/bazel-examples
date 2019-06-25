load("@io_bazel_rules_docker//java:image.bzl", "war_image")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")

java_library(
    name = "java_image_library",
    srcs = ["src/main/java/com/bmuschko/web/SimpleServlet.java"],
    deps = [
        "@maven//:org_mortbay_jetty_servlet_api",
    ],
)

war_image(
    name = "docker-image",
    srcs = ["src/main/java/com/bmuschko/web/SimpleServlet.java"],
    layers = [
        ":java_image_library",
        "@maven//:org_mortbay_jetty_servlet_api",
    ],
)