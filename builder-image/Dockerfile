FROM registry.access.redhat.com/ubi8/ubi:8.2

RUN dnf -y --disableplugin=subscription-manager install \
    java-11-openjdk-devel \
    maven

RUN dnf -y --disableplugin=subscription-manager install \
    bind-utils \
    iproute \
    iputils \
    lsof \
    procps-ng \
    zip

RUN echo 'alias ll="ls -l"' >> ${HOME}/.bashrc
