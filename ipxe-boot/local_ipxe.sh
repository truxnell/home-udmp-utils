#!/bin/sh
# This script to be used in conjunction with boostchickens
# on-boot-script.

# This basically just adds anothe conf file into the
# UDM's dnsamsq folder and reboots it (pkill at the end)
# to pick up the new file

# Change below as required (probably just the IP 10.8.20.20).
# This does not have VLAN tagging.

cat > /run/dnsmasq.conf.d/local_custom_ipxe.conf <<- "EOF"
# Legacy PXE
dhcp-match=set:bios,option:client-arch,0
dhcp-boot=tag:bios,undionly.kpxe,,10.8.20.20

# UEFI
dhcp-match=set:efi32,option:client-arch,6
dhcp-boot=tag:efi32,ipxe.efi,,10.8.20.20
dhcp-match=set:efibc,option:client-arch,7
dhcp-boot=tag:efibc,ipxe.efi,,10.8.20.20
dhcp-match=set:efi64,option:client-arch,9
dhcp-boot=tag:efi64,ipxe.efi,,10.8.20.20
dhcp-match=set:arm64,option:client-arch,11
dhcp-boot=tag:arm64,ipxe-arm64.efi,,10.8.20.20


# iPXE
dhcp-userclass=set:ipxe,iPXE
dhcp-boot=tag:ipxe,http://10.8.20.20:8081/boot.ipxe,,10.8.20.20

# tftp server URL
dhcp-option=66,10.8.20.20

EOF

# Restart dnsmasq so it sees the new conf file
pkill dnsmasq
