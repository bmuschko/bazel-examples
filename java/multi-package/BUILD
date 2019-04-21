java_binary(
    name = "app",
    srcs = glob(["app/src/main/java/com/bmuschko/app/*.java"]),
    main_class = "com.bmuschko.app.HelloWorld",
    deps = [":messenger"],
)

java_library(
    name = "messenger",
    srcs = glob(["messenger/src/main/java/com/bmuschko/messenger/*.java"]),
)