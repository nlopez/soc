#!/usr/bin/env bash

bundle check || bundle install --path vendor --local

if [ ! -d "$HOME/.chef" ]; then
  mkdir $HOME/.chef
fi

if [ -f "$HOME/.chef/knife-soc.rb" ]; then
  bundle exec knife block use knife-soc
else
  bundle exec knife block new knife-soc
fi

if [ $# == 0 ]; then
  bundle exec vagrant up
elif [ "$1" == "knife" ]; then
  bundle exec $@
elif [ "$1" == "vagrant" ]; then
  bundle exec $@
else
  bundle exec knife $@
fi
