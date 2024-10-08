# dev-values.tfvars

# AWS Region to use
aws_region = "us-east-1"

# EC2 instance type for development
instance_type = "t2.medium"

# VPC CIDR block
vpc_cidr = "10.0.0.0/16"

# Public subnet CIDR blocks
public_subnets = "10.0.1.0/24"

# Key pair name for accessing EC2 instances
key_name = "2-Teir-App"

# SSH private key path (used by Ansible)
ssh_private_key_path = "./aws-config/2-Teir-App.pem"

