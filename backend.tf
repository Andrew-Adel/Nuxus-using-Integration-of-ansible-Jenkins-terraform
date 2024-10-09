terraform {
  backend "s3" {
    bucket         = "andrew-backend-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "backend-lock"
  }
}