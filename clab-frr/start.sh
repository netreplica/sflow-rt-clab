#!/bin/sh

COLLECTOR="${COLLECTOR:-none}"

chown -R frr:frr /etc/frr

if [ "$COLLECTOR" != "none" ]; then
  /usr/sbin/hsflowd
fi
exec /usr/lib/frr/docker-start
