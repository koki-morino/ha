packer {
  required_plugins {
    googlecompute = {
      version = ">= 1.1.1"
      source = "github.com/hashicorp/googlecompute"
    }
  }
}

variable "prefix" {
  default = "mweb"
}

variable "project_id" {
  type = string
}

variable "zone" {
  type = string
  default = "asia-northeast1-a"
}

source "googlecompute" "server" {
  project_id                  = var.project_id
  zone                        = var.zone
  ssh_username                = "koki"
  source_image_family         = "ubuntu-2404-lts-amd64"
  image_name                  = "${var.prefix}-server"
  disk_size                   = 50
}

source "googlecompute" "witness" {
  project_id                  = var.project_id
  zone                        = var.zone
  ssh_username                = "koki"
  source_image_family         = "ubuntu-2404-lts-amd64"
  image_name                  = "${var.prefix}-witness"
  disk_size                   = 50
}

build {
  sources = [
    "sources.googlecompute.server",
    "sources.googlecompute.witness",
  ]

  provisioner "shell" {
    scripts = ["../scripts/update-packages.sh"]
  }

  provisioner "shell" {
    only = ["googlecompute.server"]
    scripts = [
      "../scripts/install-docker.sh",
      "../scripts/install-drbd.sh",
      "../scripts/install-ocfs2.sh",
    ]
  }

  provisioner "shell" {
    only = ["googlecompute.witness"]
    scripts = [
      "../scripts/install-docker.sh",
      "../scripts/install-pacemaker.sh",
    ]
  }

  // provisioner "file" {
  //   only = ["googlecompute.server"]
  //   source = "app.tar.gz"
  //   destination = "/tmp/app.tar.gz"
  // }
}
