#!/usr/bin/env bash

WORKSPACE_PATH=/root/bosh-lite/workspace
BOSH_DEPLOYMENTS_PATH=/root/bosh-lite/deployments
BOSH_ENV=virtualbox

source virtualbox.sh
virtualbox_install

source boshcli.sh
boshcli_install

source boshlite.sh
boshlite_install $WORKSPACE_PATH $BOSH_DEPLOYMENTS_PATH $BOSH_ENV
boshlite_addroute
boshlite_aliasenv $BOSH_DEPLOYMENTS_PATH $BOSH_ENV
boshlite_getcredentials $BOSH_DEPLOYMENTS_PATH $BOSH_ENV

source cloudfoundry.sh
cloudfoundry_install $WORKSPACE_PATH $BOSH_ENV

source cfcli.sh
cfcli_install

exit 0
