#!/bin/sh
# This script to be used in conjunction with boostchickens
# on-boot-script.

# This basically just adds anothe conf file into the
# UDM's dnsamsq folder and reboots it (pkill at the end)
# to pick up the new file

# Change below as required IP & 'domain.tld'

cat > /run/dnsmasq.conf.d/local_custom_dns.conf <<- "EOF"
# Created by a UDM-Utilities run script
# Change the domains and IP address to your own
address=/hyperion.lab/10.8.20.10
address=/domain.tld/10.8.20.210
address=/postgresql.domain.tld/10.8.20.216
address=/mariadb.domain.tld/10.8.20.211
address=/hegira.domain.tld/10.8.20.39
address=/hegira-cp.domain.tld/10.8.20.39
address=/alertmanager.hegira.domain.tld/10.8.20.210
address=/prometheus.hegira.domain.tld/10.8.20.210
address=/k10.hegira.domain.tld/10.8.20.210
address=/rook.hegira.domain.tld/10.8.20.210
address=/thanos-cluster.hegira.domain.tld/10.8.20.210
address=/technocore.domain.tld/10.8.20.20
address=/leela.domain.tld/10.8.20.30
address=/mqtt.domain.tld/10.8.20.219
EOF
 
# Restart dnsmasq so it sees the new conf file
pkill dnsmasq
