#!/bin/bash
mkdir -p /etc/chef && cp /vagrant/validation.pem "$_"
/usr/sbin/useradd chef --system -d /tmp -M -s /bin/false
