terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.37.0"
    }
  }
}
provider "aws" {
  profile = "terraform-aws"
  region  = var.region
}

resource "aws_security_group" "eth_mining_sg" {
  name        = "eth_mining_sg"
  description = "Mining SG"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip]
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "value"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
}
resource "aws_key_pair" "key_pair_public_ssh_key" {
  key_name   = var.key_pair_name
  public_key = var.key_pair_public_ssh_key
  tags = {
    Name = var.tag_name
  }
}

resource "aws_instance" "eth_mining" {
  ami               = var.ami
  instance_type     = var.instance_type
  key_name          = var.key_pair_name
  availability_zone = "${var.region}a"
  count             = 1
  security_groups   = [aws_security_group.eth_mining_sg.name]
  user_data         = data.template_cloudinit_config.ec2_init_config.rendered

  root_block_device {
    volume_size = 30
  }

  tags = {
    Name = var.tag_name
  }
}