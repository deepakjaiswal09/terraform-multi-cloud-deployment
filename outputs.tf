output "aws_instance_public_ip" {
  description = "Public IP of AWS instance"
  value       = module.aws_instance.public_ip
}

output "gcp_instance_public_ip" {
  description = "Public IP of GCP instance"
  value       = module.gcp_instance.public_ip
}
