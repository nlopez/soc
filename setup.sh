#!/usr/bin/env bash

error_exit() {
  echo "$1" >&2
  exit 1
}

readonly dot_chef="$HOME/.chef"
readonly here="$(dirname "$0")"
readonly cache="$here/.cache"

if [[ ! -e "$here/Vagrantfile" ]]; then
  cp "$here/Vagrantfile.example" "$here/Vagrantfile"
fi

bundle check >/dev/null 2>&1 || bundle install --path vendor --local

bundle exec vagrant up || error_exit "Failed to launch VMs via Vagrant"

mkdir "$dot_chef" >/dev/null 2>&1 || true
if [ -s "$dot_chef/knife.rb" ]; then # knife.rb exists and has size>0
  cp -n "$here/knife-soc.rb" "$dot_chef"
  echo
  echo "knife.rb already exists, so I've copied our config as knife-soc.rb"
  echo "Consider using knife-block to easily manage multiple knife configs"
  echo -e "\thttps://github.com/greenandsecure/knife-block"
  echo
else # knife.rb doesn't exist or is size=0
  cp "$here/knife-soc.rb" "$dot_chef/knife.rb"
  echo
  echo "knife is ready for use with the SOC Chef server!"
  echo
fi
cp -f "$cache/admin.pem" "$dot_chef/admin-soc.pem"
cp -f "$cache/validation.pem" "$dot_chef/validation-soc.pem"
