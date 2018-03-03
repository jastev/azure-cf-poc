# https://www.virtualbox.org/wiki/Linux_Downloads

function install_virtualbox() {
  echo "deb https://download.virtualbox.org/virtualbox/debian xenial contrib" >> /etc/apt/sources.list
  wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
  apt-get update
  apt-get install -y virtualbox-5.2
}
