def java_jacoco_test(name, srcs, test_class, jacoco_dep, deps = [], runtime_deps = [], **kwargs):    
    native.java_test(
        name = name,
        srcs = srcs,
        test_class = test_class,
        deps = deps,
        runtime_deps = runtime_deps,
        jvm_flags = ["-javaagent:$(location %s)=destfile=/tmp/jacoco.exec" % jacoco_dep],
        **kwargs
    )