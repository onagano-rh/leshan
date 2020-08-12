ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN if type microdnf; then (\
      microdnf --nodocs install java-11-openjdk-headless \
      && microdnf clean all \
    ) fi

EXPOSE 5683/udp 5684/udp

ARG TARGET_VERSION

COPY target/leshan-client-demo-${TARGET_VERSION}-jar-with-dependencies.jar \
     app.jar

CMD ["/usr/lib/jvm/jre/bin/java", \
     "-showversion", "-Xlog:gc::time,level,tags", \
     "-jar", "app.jar", \
     "-n", "leshan-client-demo", \
     "-lh", "leshan-client-demo", "-lp", "5683", \
     "-b", "-u", "leshan-bsserver-demo:5683" \
    ]
