module "aws_instance" {
  source     = "./modules/aws_instance"
  aws_region = var.aws_region
}

module "gcp_instance" {
  source               = "./modules/gcp_instance"
  gcp_region           = var.gcp_region
  gcp_project_id       = var.gcp_project_id
  gcp_credentials_file = var.gcp_credentials_file
}
