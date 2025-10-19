output "public_ip" {
  description = "Public IP of GCP instance"
  value       = google_compute_instance.gcp_vm.network_interface[0].access_config[0].nat_ip
}
