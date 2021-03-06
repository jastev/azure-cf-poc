# https://www.virtualbox.org/wiki/Linux_Downloads

function virtualbox_install() {
  echo "deb https://download.virtualbox.org/virtualbox/debian xenial contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
  wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
  sudo apt-get update
  sudo apt-get install -y virtualbox-5.2
}
