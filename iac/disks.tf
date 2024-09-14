resource "google_compute_disk" "disk_1" {
  name = "mweb-drbd-disk-1"
  zone = "asia-northeast1-a"
  type = "pd-ssd"
  size = 50
}

resource "google_compute_disk" "disk_2" {
  name = "mweb-drbd-disk-2"
  zone = "asia-northeast1-c"
  type = "pd-ssd"
  size = 50
}
