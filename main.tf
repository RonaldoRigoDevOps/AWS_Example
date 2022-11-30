#PROVIDER
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "MyLab_Project1" {
  ami                         = "ami-08c40ec9ead489470"
  instance_type               = "t2.micro"
  key_name                    = "mylab"
  vpc_security_group_ids      = [aws_security_group.MyLab_Project1_SG.name]
  associate_public_ip_address = true
  tags = {
    Name = "MyLab_Project1"
  }
  user_data = file("file.sh")
}

resource "aws_security_group" "MyLab_Project1_SG" {
  name        = "MyLab_Project1_SG"
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
    description = "Allow ping"
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/00"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "MyLab_Project1_SG"
  }
}

output "ARN" {
  value = aws_instance.MyLab_Project1.arn
}
output "ID" {
  value = aws_instance.MyLab_Project1.id
}
output "DNS_PUBLIC" {
  value = aws_instance.MyLab_Project1.public_dns
}
output "IP_PUBLIC" {
  value = aws_instance.MyLab_Project1.public_ip
}
