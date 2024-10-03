https://developer.hashicorp.com/packer/tutorials/docker-get-started

packer init .
packer build --force --var-file=variables.pkrvars.hcl build.pkr.hcl

packer fmt .
packer validate .
