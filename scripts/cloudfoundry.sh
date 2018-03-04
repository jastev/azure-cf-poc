# https://www.starkandwayne.com/blog/running-cloud-foundry-locally-on-bosh-lite-with-bosh2/

CLOUDFOUNDRY_REPO=https://github.com/cloudfoundry/cf-deployment

function cloudfoundry_install() {
  pushd .
  sudo mkdir -p $1/cf-deployment
  git clone $CLOUDFOUNDRY_REPO $1/cf-deployment
  cd $1/cf-deployment

  bosh -n -e $2 upload-stemcell https://bosh.io/d/stemcells/bosh-warden-boshlite-ubuntu-trusty-go_agent
  bosh -n -e $2 update-cloud-config iaas-support/bosh-lite/cloud-config.yml
  bosh -n -e $2 -d cf deploy cf-deployment.yml \
    -o operations/bosh-lite.yml \
    --vars-store deployment-vars.yml \
    -v system_domain=bosh-lite.com
  popd
}

