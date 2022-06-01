#! /bin/bash -e
pushd /vagrant
ansible-playbook provisioning/playbook.yml
popd
export http_proxy='http://localhost:3128'
export https_proxy='http://localhost:3128'
