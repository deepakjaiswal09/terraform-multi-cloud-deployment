resource "google_compute_instance" "gcp_vm" {
  name         = "gcp-nginx-server"
  machine_type = "e2-micro"
  zone         = "${var.gcp_region}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt update -y
    apt install -y nginx
    echo "Hello from GCP Cloud via Terraform" > /var/www/html/index.html
  EOF

  tags = ["nginx-server"]
}
