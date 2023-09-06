FROM quay.io/fedora/fedora:38

RUN dnf install -y --nodocs R \
    && dnf clean all \
    && rm -rf /var/cache/yum
