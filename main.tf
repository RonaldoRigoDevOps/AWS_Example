# The configuration for the `remote` backend.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "ronaldorigo"

    workspaces {
      name = "ronaldo_rigo"
    }
  }
}

#PROVIDER
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "MyLab2" {
  ami                         = "ami-08c40ec9ead489470"
  instance_type               = "t2.micro"
  key_name                    = "mylab"
  vpc_security_group_ids      = "MyLab2_SG"
  associate_public_ip_address = true
  tags = {
    Name = "MyLab2"
  }
  user_data	= file("file.sh")
}
