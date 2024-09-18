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

source "googlecompute" "server-1" {
  project_id                  = var.project_id
  zone                        = var.zone
  // scp requires elevated privilege to copy files into /etc/drbd.d.
  ssh_username                = "root"
  source_image_family         = "ubuntu-2404-lts-amd64"
  image_name                  = "${var.prefix}-server-1"
  disk_size                   = 50
}

source "googlecompute" "server-2" {
  project_id                  = var.project_id
  zone                        = var.zone
  ssh_username                = "root"
  source_image_family         = "ubuntu-2404-lts-amd64"
  image_name                  = "${var.prefix}-server-2"
  disk_size                   = 50
}

build {
  sources = [
    "sources.googlecompute.server-1",
    "sources.googlecompute.server-2",
  ]

  // Install packages.
  provisioner "shell" {
    environment_vars = ["USERNAME=koki"]
    scripts = [
      "../scripts/install-docker.sh",
      "../scripts/install-pcmk.sh",
      "../scripts/install-drbd.sh",
      "../scripts/install-ocfs2.sh",
    ]
  }

  // Install Corosync files.
  provisioner "file" {
    sources = [
      "../corosync/authkey",
    ]
    destination = "/etc/corosync/authkey"
  }

  provisioner "shell" {
    inline = [
      "chmod 400 /etc/corosync/authkey",
    ]
  }

  provisioner "file" {
    sources = [
      "../corosync/service.d/pcmk",
    ]
    destination = "/etc/corosync/service.d/pcmk"
  }

  provisioner "file" {
    only = ["googlecompute.server-1"]
    sources = [
      "../corosync/corosync-1.conf",
    ]
    destination = "/etc/corosync/corosync.conf"
  }

  provisioner "file" {
    only = ["googlecompute.server-2"]
    sources = [
      "../corosync/corosync-2.conf",
    ]
    destination = "/etc/corosync/corosync.conf"
  }

  // Install DRBD files.
  provisioner "file" {
    sources = [
      "../drbd/global_common.conf",
      "../drbd/datastore.res",
    ]
    destination = "/etc/drbd.d/"
  }

  provisioner "file" {
    only = ["googlecompute.server-1"]
    source = "../drbd/handle-split-brain-1.sh"
    destination = "/usr/lib/drbd/handle-split-brain.sh"
  }

  provisioner "file" {
    only = ["googlecompute.server-2"]
    source = "../drbd/handle-split-brain-2.sh"
    destination = "/usr/lib/drbd/handle-split-brain.sh"
  }

  provisioner "shell" {
    inline = [
      "chmod 755 /usr/lib/drbd/handle-split-brain.sh",
    ]
  }

  // Add peer hostnames.
  provisioner "shell" {
    only = ["googlecompute.server-1"]
    inline = [
      "echo '10.1.0.10 mweb-server-2' >> /etc/hosts",
    ]
  }

  provisioner "shell" {
    only = ["googlecompute.server-2"]
    inline = [
      "echo '10.0.0.10 mweb-server-1' >> /etc/hosts",
    ]
  }
}
