terraform {
  backend "s3" {
    bucket = "terraform-user11-s3-bucket-19-07-2025"
    key    = "states/terraform.state"
    region = "eu-north-1"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.94.1"
    }
  }
}

provider "aws" {
  region = var.region
}
