resource "google_compute_instance" "instance_1" {
  name         = "${var.prefix}-instance-1"
  machine_type = "e2-medium"
  zone         = var.zone_1

  boot_disk {
    initialize_params {
      image = "projects/${var.project_id}/global/images/mweb-server"
      type  = "pd-balanced"
      size  = 50
    }
  }

  network_interface {
    network    = google_compute_network.default.name
    subnetwork = google_compute_subnetwork.subnet_1.id
    network_ip = "10.0.1.3"
    access_config {
    }
  }

  metadata = {
    user-data = file("./scripts/cloud-config-server-1.yaml")
  }

  tags = setunion(
    google_compute_firewall.allow-internal.target_tags,
    google_compute_firewall.allow-ssh.target_tags,
    google_compute_firewall.allow-health-check.target_tags,
  )
}

resource "google_compute_instance" "instance_2" {
  name         = "${var.prefix}-instance-2"
  machine_type = "e2-medium"
  zone         = var.zone_2

  boot_disk {
    initialize_params {
      image = "projects/${var.project_id}/global/images/mweb-server"
      type  = "pd-balanced"
      size  = 50
    }
  }

  network_interface {
    network    = google_compute_network.default.name
    subnetwork = google_compute_subnetwork.subnet_2.id
    network_ip = "10.0.11.3"
    access_config {
    }
  }

  metadata = {
    user-data = file("./scripts/cloud-config-server-2.yaml")
  }

  tags = setunion(
    google_compute_firewall.allow-internal.target_tags,
    google_compute_firewall.allow-ssh.target_tags,
    google_compute_firewall.allow-health-check.target_tags,
  )
}

resource "google_compute_instance" "instance_witness" {
  name         = "${var.prefix}-instance-witness"
  machine_type = "e2-medium"
  zone         = var.zone_3

  boot_disk {
    initialize_params {
      image = "projects/${var.project_id}/global/images/mweb-witness"
      type  = "pd-balanced"
      size  = 50
    }
  }

  network_interface {
    network    = google_compute_network.default.name
    subnetwork = google_compute_subnetwork.subnet_3.id
    network_ip = "10.0.21.3"
    access_config {
    }
  }

  metadata = {
    user-data = file("./scripts/cloud-config-witness.yaml")
  }

  tags = setunion(
    google_compute_firewall.allow-internal.target_tags,
    google_compute_firewall.allow-ssh.target_tags,
  )
}
