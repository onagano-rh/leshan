ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN if type microdnf; then (\
      microdnf --nodocs install java-11-openjdk-headless \
      && microdnf clean all \
    ) fi

EXPOSE 8080 5683/udp 5684/udp

ARG TARGET_VERSION

COPY target/leshan-server-demo-${TARGET_VERSION}-jar-with-dependencies.jar \
     app.jar

CMD ["/usr/lib/jvm/jre/bin/java", "-jar", "app.jar"]