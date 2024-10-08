https://wiki.debian.org/KVM
https://developer.hashicorp.com/packer/tutorials/docker-get-started

packer init .
packer build --force --var-file=variables.pkrvars.hcl vm.pkr.hcl

packer fmt .
packer validate --var-file=variables.pkrvars.hcl .
