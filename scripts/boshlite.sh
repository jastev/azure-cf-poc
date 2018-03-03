# https://bosh.io/docs/bosh-lite

BOSHLITE_REPO=https://github.com/cloudfoundry/bosh-deployment

function install_boshlite() {
  apt-get install -y ruby

  mkdir -p $1/bosh-deployment
  git clone $BOSHLITE_REPO $1/bosh-deployment

  mkdir -p $2
  bosh create-env $1/bosh-deployment/bosh.yml \
    --state $2/state.json \
    -o $1/bosh-deployment/virtualbox/cpi.yml \
    -o $1/bosh-deployment/virtualbox/outbound-network.yml \
    -o $1/bosh-deployment/bosh-lite.yml \
    -o $1/bosh-deployment/bosh-lite-runc.yml \
    -o $1/bosh-deployment/jumpbox-user.yml \
    --vars-store $2/creds.yml \
    -v director_name="Bosh Lite Director" \
    -v internal_ip=192.168.50.6 \
    -v internal_gw=192.168.50.1 \
    -v internal_cidr=192.168.50.0/24 \
    -v outbound_network_name=NatNetwork
}
