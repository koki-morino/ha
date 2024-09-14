resource "google_compute_instance" "instance_1" {
  name         = "${var.prefix}-instance-1"
  machine_type = "e2-medium"
  zone         = var.zone_1

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2404-noble-amd64-v20240830"
      type  = "pd-balanced"
      size  = 50
    }
  }

  network_interface {
    network    = google_compute_network.default.name
    subnetwork = google_compute_subnetwork.subnet_1.id
    access_config {
    }
  }

  metadata = {
    user-data = file("./cloud-config.yaml")
  }

  tags = google_compute_firewall.rules.target_tags
}

resource "google_compute_instance" "instance_2" {
  name         = "${var.prefix}-instance-2"
  machine_type = "e2-medium"
  zone         = var.zone_2

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2404-noble-amd64-v20240830"
      type  = "pd-balanced"
      size  = 50
    }
  }

  network_interface {
    network    = google_compute_network.default.name
    subnetwork = google_compute_subnetwork.subnet_2.id
    access_config {
    }
  }

  metadata = {
    user-data = file("./cloud-config.yaml")
  }

  tags = google_compute_firewall.rules.target_tags
}

resource "google_compute_instance" "instance_witness" {
  name         = "${var.prefix}-instance-witness"
  machine_type = "e2-medium"
  zone         = var.zone_3

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2404-noble-amd64-v20240830"
      type  = "pd-balanced"
      size  = 50
    }
  }

  network_interface {
    network    = google_compute_network.default.name
    subnetwork = google_compute_subnetwork.subnet_3.id
    access_config {
    }
  }

  metadata = {
    user-data = file("./cloud-config.yaml")
  }

  tags = google_compute_firewall.rules.target_tags
}
