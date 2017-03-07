#!/bin/bash

# Configure network interface as item.0
cat >/etc/sysconfig/network-scripts/ifcfg-ens3 <<EOF
DEVICE="ens3"
NM_CONTROLLED="no"
ONBOOT=yes
TYPE=Ethernet
BOOTPROTO=static
NAME="connection-ens3"
IPADDR=192.168.102.10
NETMASK=255.255.255.0
GATEWAY=192.168.102.1
DNS1=192.168.1.1
EOF

# Configure network interface as item.0
cat >/etc/sysconfig/network-scripts/ifcfg-ens4 <<EOF
DEVICE="ens4"
NM_CONTROLLED="no"
ONBOOT=yes
TYPE=Ethernet
BOOTPROTO=static
NAME="connection-ens4"
IPADDR=192.168.103.10
NETMASK=255.255.255.0
DNS1=192.168.1.1
EOF
