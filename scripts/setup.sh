#!/usr/bin/env bash

source virtualbox.sh
install_virtualbox

source boshcli.sh
install_bosh2cli

source boshlite.sh
install_boshlite /root/bosh-lite/workspace /root/bosh-lite/deployments/virtualbox

exit 0
