#!/usr/bin/env bash

HOME=/root
WORKSPACE_PATH=$HOME/bosh-lite/workspace
BOSH_DEPLOYMENTS_PATH=$HOME/bosh-lite/deployments
BOSH_ENV=virtualbox

source virtualbox.sh
virtualbox_install

source boshcli.sh
boshcli_install

source boshlite.sh
boshlite_installdependencies
boshlite_clonerepo $WORKSPACE_PATH
boshlite_changevmparams $WORKSPACE_PATH
boshlite_install $WORKSPACE_PATH $BOSH_DEPLOYMENTS_PATH $BOSH_ENV
boshlite_addroute
boshlite_aliasenv $BOSH_DEPLOYMENTS_PATH $BOSH_ENV
boshlite_getcredentials $BOSH_DEPLOYMENTS_PATH $BOSH_ENV

source cloudfoundry.sh
cloudfoundry_install $WORKSPACE_PATH $BOSH_ENV

source cfcli.sh
cfcli_install

exit 0
