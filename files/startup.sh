#!/bin/bash
if [ -d /home/vagrant/huraemon ]; then
  cd /home/vagrant/huraemon
  grunt server:production &>/home/vagrant/.huraemon.log
else
  echo "Huraemon has not been installed." > /home/vagrant/.huraemon.log
fi
