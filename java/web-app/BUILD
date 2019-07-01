load("//rules:java_war.bzl", "java_war")

java_war(
    name = "web-app",
    web_app_dir = "src/main/webapp",
    deps = [
        "@maven//:org_mortbay_jetty_servlet_api",
    ],
)