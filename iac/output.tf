output "server_1_ip" {
  value = google_compute_instance.instance_1.network_interface[0].access_config[0].nat_ip
}

output "server_2_ip" {
  value = google_compute_instance.instance_2.network_interface[0].access_config[0].nat_ip
}

output "witness_ip" {
  value = google_compute_instance.instance_witness.network_interface[0].access_config[0].nat_ip
}
