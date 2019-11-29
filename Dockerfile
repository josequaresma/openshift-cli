FROM frolvlad/alpine-glibc:latest

MAINTAINER Daniel Widerin <daniel@widerin.net>
MAINTAINER Jose Quaresma <contact@josequaresma.com>

ENV OC_VERSION=4.2.8 \
    BUILD_DEPS='tar gzip' \
    RUN_DEPS='curl ca-certificates gettext'

RUN apk --no-cache add $BUILD_DEPS $RUN_DEPS && \
    curl -sLo /tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux-${OC_VERSION}.tar.gz && \
    tar xzvf /tmp/oc.tar.gz -C /tmp/ && \
    mv /tmp/openshift-client-linux-${OC_VERSION}/oc /usr/local/bin/ && \
    rm -rf /tmp/oc.tar.gz /tmp/openshift-client-linux-${OC_VERSION} && \
    apk del $BUILD_DEPS

CMD ["/usr/local/bin/oc"]
