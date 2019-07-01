load("//rules:java_war.bzl", "java_war")

java_war(
    name = "web-app",
    java_srcs = glob(["src/main/java/**/*.java"]),
    compression = True,
    deps = [
        "@maven//:org_mortbay_jetty_servlet_api",
        "@maven//:ch_qos_logback_logback_classic",
    ],
)