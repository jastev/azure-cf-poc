# https://bosh.io/docs/bosh-lite

BOSHLITE_REPO=https://github.com/cloudfoundry/bosh-deployment

function boshlite_install() {
  echo "Installing ruby"
  sudo apt-get install -y ruby

  echo "Cloning bosh-deployment"
  mkdir -p $1/bosh-deployment
  git clone $BOSHLITE_REPO $1/bosh-deployment

  export TMPDIR=/tmp

  echo "---- ENV ---"
  env
  echo "-----------"

  echo "Deploying BOSH Director"
  mkdir -p $2
  export BOSH_LOG_LEVEL=debug
  bosh -n create-env $1/bosh-deployment/bosh.yml \
    --state $2/$3/state.json \
    -o $1/bosh-deployment/virtualbox/cpi.yml \
    -o $1/bosh-deployment/virtualbox/outbound-network.yml \
    -o $1/bosh-deployment/bosh-lite.yml \
    -o $1/bosh-deployment/bosh-lite-runc.yml \
    -o $1/bosh-deployment/jumpbox-user.yml \
    --vars-store $2/$3/creds.yml \
    -v director_name="Bosh Lite Director" \
    -v internal_ip=192.168.50.6 \
    -v internal_gw=192.168.50.1 \
    -v internal_cidr=192.168.50.0/24 \
    -v outbound_network_name=NatNetwork
}

function boshlite_addroute() {
  sudo ip route add 10.244.0.0/16 via 192.168.50.6
}

function boshlite_getcredentials() {
  export BOSH_CLIENT=admin
  export BOSH_CLIENT_SECRET=`bosh -n --config ./bosh.config int $1/$2/creds.yml --path /admin_password`
}

function boshlite_aliasenv() {
  bosh -n --config ./bosh.config alias-env $2 -e 192.168.50.6 --ca-cert <(bosh -n --config ./bosh.config int $1/$2/creds.yml --path /director_ssl/ca)
}

