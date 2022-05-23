FROM alpine:latest as build
RUN apk --update add \
      build-base \
      gcc \
      git \
      libpcap-dev \
      linux-headers \
 && git clone https://github.com/sflow/host-sflow.git \
 && cd host-sflow \
 && make FEATURES="PCAP" \
 && make install

FROM frrouting/frr:v8.2.2
LABEL maintainer="Netreplica"
LABEL description="FRR and Host sFlow agent for CONTAINERlab, fork of sflow/clab-frr"
LABEL url=https://hub.docker.com/r/netreplica/frr-sflow
COPY --from=build /usr/sbin/hsflowd /usr/sbin/hsflowd
COPY --from=build /etc/hsflowd/ /etc/hsflowd/
RUN apk add --no-cache dmidecode libpcap
ADD start.sh /
ENTRYPOINT [ "/sbin/tini", "--", "/start.sh" ]
