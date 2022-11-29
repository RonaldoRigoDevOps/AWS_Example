terraform {
  cloud {
    organization = "ronaldorigo"

    workspaces {
      name = "ronaldorigo_mylab"
    }
  }
}
#Instance parameters
resource "aws_instance" "MyLab" {
  #count                       = 1
  ami                         = "ami-08c40ec9ead489470"
  instance_type               = "t2.micro"
  key_name                    = "mylab"
  security_groups             = [aws_security_group.MyLab_SG.name]
  associate_public_ip_address = true
  tags = {
    Name = "MyLab"
    # Name = "MyLab-Production${count.index}"
  }
}

#Security groups parameters
resource "aws_security_group" "MyLab_SG" {
  name        = "MyLab_SG"
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
    Name = "MyLab_SG"
  }
}
