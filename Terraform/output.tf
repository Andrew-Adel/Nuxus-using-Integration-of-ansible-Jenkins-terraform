# terraform/outputs.tf

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.My_VPC_Instance.vpc_id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = module.My_VPC_Instance.public_subnet_id
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = module.My_VPC_Instance.security_group_id
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.My_EC2_Instance.instance_public_ip
}

output "inventory_file" {
  description = "Ansible inventory file content"
  value       = module.My_EC2_Instance.inventory_file
}

# resource "local_file" "inventory_file" {
#   content  = module.My_EC2_Instance.inventory_file
#   filename = "../Ansible/inventory"
# }

resource "local_file" "inventory_file" {
  content  = <<EOF
[nexus]
${aws_instance.web.public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=../${var.key_name}.pem
EOF
  filename = "../Ansible/inventory"
}