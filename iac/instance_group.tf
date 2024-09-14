resource "google_compute_instance_group" "instance_group_1" {
  name = "${var.prefix}-instance-group-1"
  zone = var.zone_1

  instances = [
    google_compute_instance.instance_1.id,
  ]

  named_port {
    name = var.service_port_name
    port = var.service_port
  }
}

resource "google_compute_instance_group" "instance_group_2" {
  name = "${var.prefix}-instance-group-2"
  zone = var.zone_2

  instances = [
    google_compute_instance.instance_2.id,
  ]

  named_port {
    name = var.service_port_name
    port = var.service_port
  }
}
