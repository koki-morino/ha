resource "google_compute_network" "default" {
  name                    = "${var.prefix}-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet_1" {
  name          = "${var.prefix}-subnet-tokyo"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region_1
  network       = google_compute_network.default.id
}

resource "google_compute_subnetwork" "subnet_2" {
  name          = "${var.prefix}-subnet-osaka"
  ip_cidr_range = "10.0.11.0/24"
  region        = var.region_2
  network       = google_compute_network.default.id
}

resource "google_compute_subnetwork" "subnet_3" {
  name          = "${var.prefix}-subnet-seoul"
  ip_cidr_range = "10.0.21.0/24"
  region        = var.region_3
  network       = google_compute_network.default.id
}

resource "google_compute_firewall" "rules" {
  name    = "${var.prefix}-firewall-rule"
  network = google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "8080"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["extern"]
}
