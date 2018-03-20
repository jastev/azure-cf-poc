#!/usr/bin/env bash

WORKSPACE_PATH=/root/bosh-lite/workspace
BOSH_DEPLOYMENTS_PATH=/root/bosh-lite/deployments
BOSH_ENV=virtualbox

echo "Installing Virtualbox..."
source virtualbox.sh
virtualbox_install

echo "Installing bosh CLI..."
source boshcli.sh
boshcli_install

echo "Installing bosh-lite..."
source boshlite.sh
boshlite_install $WORKSPACE_PATH $BOSH_DEPLOYMENTS_PATH $BOSH_ENV
boshlite_addroute
boshlite_aliasenv $BOSH_DEPLOYMENTS_PATH $BOSH_ENV
boshlite_getcredentials $BOSH_DEPLOYMENTS_PATH $BOSH_ENV

echo "Installing Cloud Foundry..."
source cloudfoundry.sh
cloudfoundry_install $WORKSPACE_PATH $BOSH_ENV

echo "Installing cf CLI..."
source cfcli.sh
cfcli_install

exit 0
