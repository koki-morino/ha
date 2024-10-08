packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu" {
  image  = "ubuntu:jammy"
  commit = true
}

build {
  name = "learn-packer"
  sources = [
    "source.docker.ubuntu"
  ]

  post-processors {
    post-processor "docker-tag" {
      repository = ""
      tags = ["latest"]
    }

    post-processor "docker-push" {
      login              = true
      login_server   = var.container_registry
      login_username = var.container_registry_username
      login_password = var.container_registry_password
    }
  }
}
