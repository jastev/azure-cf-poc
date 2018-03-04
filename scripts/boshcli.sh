# https://bosh.io/docs/cli-v2.html#install

function install_bosh2cli() {
  pushd .
  cd /tmp
  wget -nc https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-2.0.48-linux-amd64
  chmod +x ./bosh-cli-2.0.48-linux-amd64
  sudo mv ./bosh-cli-2.0.48-linux-amd64 /usr/local/bin
  sudo ln -s /usr/local/bin/bosh-cli-2.0.48-linux-amd64 /usr/local/bin/bosh2
  sudo ln -s /usr/local/bin/bosh2 /usr/local/bin/bosh
  popd
}
