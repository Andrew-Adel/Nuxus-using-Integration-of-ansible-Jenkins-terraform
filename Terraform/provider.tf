terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  shared_config_files      = ["./aws-config/config"]
  shared_credentials_files = ["./aws-config/credentials"]
  profile                  = "Terraform-first-profile"

}