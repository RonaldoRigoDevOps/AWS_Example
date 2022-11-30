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

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "MyLab2" {
  ami                         = "ami-08c40ec9ead489470"
  instance_type               = "t2.micro"
  key_name                    = "mylab"
  vpc_security_group_ids = [aws_security_group.MyLab2_SG.name]
  associate_public_ip_address = true
  tags = {
    Name = "MyLab2"
  }
# user_data = <<-EOF
#              #!/bin/bash
#              apt-get update
#              apt-get install -y apache2
#              sed -i -e 's/80/8080/' /etc/apache2/ports.conf
#              echo "Hello World" > /var/www/html/index.html
#              systemctl restart apache2
#              EOF
}

resource "aws_security_group" "MyLab2_SG" {
  name        = "MyLab2_SG"
  description = "Allow Access By TCP/22 & TCP/80 & TCP/8080"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP_8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP_3000"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
  description       = "Allow ping"
  from_port         = 8
  to_port           = 0
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/00"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "MyLab2_SG"
  }
}

output "ARN" {
  value = aws_instance.MyLab2.arn
}
output "ID" {
  value = aws_instance.MyLab2.id
}
output "DNS_PUBLIC" {
  value = aws_instance.MyLab2.public_dns
}
output "IP_PUBLIC" {
  value = aws_instance.MyLab2.public_ip
}
