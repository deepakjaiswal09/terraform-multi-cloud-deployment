variable "gcp_region" {
  description = "GCP Region for instance"
  type        = string
  default     = "us-central1"
}

variable "gcp_project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "gcp_credentials_file" {
  description = "Path to GCP credentials file"
  type        = string
  default     = "~/.gcp/terraform-key.json"
}
