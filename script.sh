#!/bin/bash
# combustion: network
echo "Starting script"
# Put all command output into the logs
set -x

echo "Comecando secao de particao"
mkdir -v /opt/data
#Formatar o disco
mkfs.ext4 /dev/sdb
#Montar 
mount /dev/sdb /opt/data

echo "Comecando secao de root"
echo '$6$a.G2Mhva/KDNXVoO$MfdgrEYAKezpGDZbrQd8xJoBRx6B8OVFNYTZ183tJcLndU574ugYeGWLYTaKH/kW.OyLekp2B6ieXkKbhptDp/' | chpasswd -e

echo "Comecando secao de arquivos"
echo "192.168.1.12  example.com" >> /etc/hosts
touch /root/log.txt
date > /root/log.txt

echo "Comecando secao de servicos"
systemctl enable cockpit.socket

echo "Comecando secao de registros"
SUSEConnect -r INTERNAL-USE-ONLY-7ccb-7e0a -e gabriel.lins@suse.com

echo "Comecando secao de pacotes"
zypper -n install \
tar \
conmon \
ceph \
curl \
vim \
iputils

zypper -n up

echo "Comecando secao avancada"
for dir in {1..5};
  do mkdir -p /root/mnt/$dir;
done