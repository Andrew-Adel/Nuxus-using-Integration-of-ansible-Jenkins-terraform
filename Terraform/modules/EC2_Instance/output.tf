# terraform/modules/ec2/outputs.tf

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "inventory_file" {
  description = "Ansible inventory file content"
  value       = <<EOF
[nexus]
${aws_instance.web.public_ip} ansible_user=ec2-user
EOF
}
//# ansible_ssh_private_key_file=../${var.key_name}.pem
