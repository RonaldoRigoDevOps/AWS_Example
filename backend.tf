terraform {
  required_version = "~> 0.13.5"

  backend "s3" {
    region         = "us-east-1"
    bucket         = "leialoft-poc-terraform-tfstate-backend"
    dynamodb_table = "leialoft-poc-terraform-tfstate-backend-lock"
    profile        = ""
    role_arn       = ""
    encrypt        = "true"
    key            = "projectdevops-deleteme/terraform.tfsate"
  }
}