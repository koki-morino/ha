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

resource "google_compute_firewall" "allow-internal" {
  name    = "${var.prefix}-firewall-allow-internal"
  network = google_compute_network.default.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  source_ranges = ["10.0.1.0/24", "10.0.11.0/24", "10.0.21.0/24"]
  target_tags   = ["internal"]
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "${var.prefix}-firewall-allow-ssh"
  network = google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

resource "google_compute_firewall" "allow-health-check" {
  name    = "${var.prefix}-firewall-allow-health-check"
  network = google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports = [
      "8080",  # HTTP
      "27017", # MongoDB
    ]
  }

  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
  target_tags   = ["health-check"]
}
