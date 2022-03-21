FROM registry.redhat.io/amq7/amq-broker-init-rhel7:0.2-17
USER root:root
COPY ./lib/ /amq/lib/
COPY ./config/ /amq/scripts/
