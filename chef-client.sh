#!/bin/bash
guest_cache_path="/tmp/vagrant-cache"
mkdir -p /etc/chef && cp "$guest_cache_path/validation.pem" "$_"
/usr/sbin/useradd chef --system -d /tmp -M -s /bin/false || /bin/true
