java_library(
    name = "messenger",
    srcs = ["src/main/java/com/bmuschko/messenger/Messenger.java"],
)

java_binary(
    name = "hello-world",
    srcs = ["src/main/java/com/bmuschko/HelloWorld.java"],
    deps = [":messenger"],
    main_class = "com.bmuschko.HelloWorld"
)