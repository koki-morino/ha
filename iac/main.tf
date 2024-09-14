terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = "mweb-network"
}

resource "google_compute_firewall" "rules" {
  name    = "mweb-firewall-rule"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["extern"]
}

resource "google_compute_instance" "vm_instance_1" {
  name         = "mweb-instance-1"
  machine_type = "e2-medium"
  zone         = "asia-northeast1-a"

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2404-noble-amd64-v20240830"
      size  = 50
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }

  metadata = {
    user-data = file("./cloud-config.yaml")
  }

  tags = google_compute_firewall.rules.target_tags
}

resource "google_compute_instance" "vm_instance_2" {
  name         = "mweb-instance-2"
  machine_type = "e2-medium"
  zone         = "asia-northeast1-c"

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2404-noble-amd64-v20240830"
      size  = 50
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }

  metadata = {
    user-data = file("./cloud-config.yaml")
  }

  tags = google_compute_firewall.rules.target_tags
}
