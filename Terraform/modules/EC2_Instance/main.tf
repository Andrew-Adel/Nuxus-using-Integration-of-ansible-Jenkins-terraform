# terraform/modules/ec2/main.tf

data "aws_ami" "amazon_linux" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  owners = ["137112412989"] # Amazon
}

resource "aws_instance" "web" {
  # ami                    = data.aws_ami.amazon_linux.id
  ami                    = "ami-066784287e358dad1"
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "public-ec2"
  }
}
