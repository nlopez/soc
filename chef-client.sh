#!/usr/bin/env bash
mkdir -p /etc/chef && cp "/vagrant/.cache/validation.pem" "/etc/chef/validation.pem"
/usr/sbin/useradd chef --system -d /tmp -M -s /bin/false || /bin/true
