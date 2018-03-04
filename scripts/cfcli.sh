# https://docs.cloudfoundry.org/cf-cli/install-go-cli.html

function cfcli_install() {
  echo "deb https://packages.cloudfoundry.org/debian stable main" | sudo tee /etc/apt/sources.list.d/cloudfoundry-cli.list
  wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | sudo apt-key add -
  sudo apt-get update
  sudo apt-get install -y cf-cli
}
