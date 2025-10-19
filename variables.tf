# AWS Variables
variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}

variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

# GCP Variables
variable "gcp_credentials_file" {
  description = "Path to GCP credentials JSON file"
  default     = "~/.gcp/terraform-key.json"
}

variable "gcp_project_id" {
  description = "GCP Project ID"
}

variable "gcp_region" {
  description = "GCP Region"
  default     = "us-central1"
}
