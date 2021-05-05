provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket  = "react-aws-app-state"
    key     = "react-app.awsstate"
    region  = "eu-central-1"
    encrypt = true
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Enviroment = terraform.workspace
    Project    = var.project
    ManageBy   = "Terraform"
    Owner      = "Ravit Dabush"
  }
}