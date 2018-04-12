# https://www.starkandwayne.com/blog/running-cloud-foundry-locally-on-bosh-lite-with-bosh2/

CLOUDFOUNDRY_REPO=https://github.com/cloudfoundry/cf-deployment

function cloudfoundry_install() {
  pushd .
  mkdir -p $1/cf-deployment
  git clone $CLOUDFOUNDRY_REPO $1/cf-deployment
  cd $1/cf-deployment

  bosh -n -e $2 upload-stemcell https://s3.amazonaws.com/bosh-core-stemcells/warden/bosh-stemcell-3541.12-warden-boshlite-ubuntu-trusty-go_agent.tgz
  bosh -n -e $2 update-cloud-config iaas-support/bosh-lite/cloud-config.yml
  bosh -n -e $2 -d cf deploy cf-deployment.yml \
    -o operations/bosh-lite.yml \
    --vars-store deployment-vars.yml \
    -v system_domain=bosh-lite.com
  popd
}

