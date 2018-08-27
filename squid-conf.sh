#!/bin/bash
sudo cp /var/tmp/squid/squid.conf /etc/squid/squid.conf
sudo cp /var/tmp/squid/https_whitelist.txt /etc/squid/https_whitelist.txt
sudo cp /var/tmp/squid/http_whitelist.txt /etc/squid/http_whitelist.txt
sudo cp -r /var/tmp/squid/ssl /etc/squid
sudo chown root:root /etc/squid/ssl -R
sudo chmod +x /etc/squid/ssl
sudo chmod 640 /etc/squid/squid.conf 
sudo chmod 644 /etc/squid/https_whitelist.txt
sudo chmod 644 /etc/squid/http_whitelist.txt
sudo /bin/systemctl restart squid
sudo cp /var/tmp/squid/iptables /etc/sysconfig/iptables 
sudo chmod 600 /etc/sysconfig/iptables
sudo service iptables restart
