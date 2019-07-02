load("//rules:java_war.bzl", "java_war")

test_suite(
  name = "test-suite",
  tests = [
      ":test-minimal",
      ":test-extdeps",
      ":test-custom",
  ],
)

java_war(
    name = "minimal",
    java_srcs = glob(["src/main/java/**/*.java"]),
    deps = [
        "@maven//:org_mortbay_jetty_servlet_api",
    ],
)

sh_test(
    name = "test-minimal",
    srcs = [":minimal_verification.sh"],
    args = ["$(location :minimal.war)"],
    data = [":minimal.war"],
)

java_war(
    name = "extdeps",
    java_srcs = glob(["src/main/java/**/*.java"]),
    deps = [
        "@maven//:org_mortbay_jetty_servlet_api",
        "@maven//:ch_qos_logback_logback_classic",
    ],
)

sh_test(
    name = "test-extdeps",
    srcs = [":extdeps_verification.sh"],
    args = ["$(location :extdeps.war)"],
    data = [":extdeps.war"],
)

java_war(
    name = "custom",
    java_srcs = glob(["custom/java/**/*.java"]),
    web_app_dir = "custom/web",
    deps = [
        "@maven//:org_mortbay_jetty_servlet_api",
    ],
)

sh_test(
    name = "test-custom",
    srcs = [":custom_verification.sh"],
    args = ["$(location :custom.war)"],
    data = [":custom.war"],
)