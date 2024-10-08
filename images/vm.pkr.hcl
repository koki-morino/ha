packer {
  required_plugins {
    qemu = {
      version = "~> 1"
      source  = "github.com/hashicorp/qemu"
    }
    vagrant = {
      version = "~> 1"
      source  = "github.com/hashicorp/vagrant"
    }
    googlecompute = {
      version = "~> 1"
      source  = "github.com/hashicorp/googlecompute"
    }
  }
}

variables {
  bucket_id       = ""
  project_id      = ""
  serial       = "ttyUSB0"
}

source "qemu" "default" {
  accelerator = "kvm"
  boot_command = [
    "<tab> console=ttyS0,115200n8 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/fedora-31-ks.cfg rd.live.check=0<enter><wait>"
  ]
  disk_size        = "15000"
  format           = "raw"
  iso_checksum     = "sha256:225ebc160e40bb43c5de28bad9680e3a78a9db40c9e3f4f42f3ee3f10f95dbeb"
  iso_url          = "https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/31/Server/x86_64/iso/Fedora-Server-dvd-x86_64-31-1.9.iso"
  headless         = "true"
  http_directory   = "http"
  http_port_max    = "10089"
  http_port_min    = "10082"
  output_directory = "output"
  shutdown_timeout = "30m"
  shutdown_command = "echo 'vagrant'|sudo -S shutdown -P now"
  ssh_username     = "vagrant"
  ssh_password     = "vagrant"
  vm_name          = "disk.raw"
  qemu_binary      = "/usr/bin/kvm"
  qemuargs = [
    ["-m", "1024"],
    ["-cpu", "host"],
    ["-chardev", "tty,id=pts,path=${var.serial}"],
    ["-device", "isa-serial,chardev=pts"],
    ["-device", "virtio-net,netdev=user.0"]
  ]
}

build {
  sources = ["source.qemu.default"]

  post-processors {
    post-processor "vagrant" {
      output = "output/{{.BuildName}}_{{.Provider}}_{{.Architecture}}.box"
    }

    post-processor "compress" {
      output = "output/disk.raw.tar.gz"
    }

    post-processor "googlecompute-import" {
      bucket            = var.bucket_id
      project_id        = var.project_id
      image_name        = "fedora31-server-packertest"
      image_description = "Fedora 31 Server"
      image_family      = "fedora31-server"
    }
  }
}
