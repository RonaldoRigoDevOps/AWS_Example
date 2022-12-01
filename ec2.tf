resource "aws_instance" "MyLab_Project1" {
  ami                         = "ami-08c40ec9ead489470"
  instance_type               = "t2.micro"
  key_name                    = "mylab"
  vpc_security_group_ids      = [aws_security_group.MyLab_Project1_SG.name]
  associate_public_ip_address = true
  tags = {
    Name = "MyLab_Project1"
  }
  user_data = file("AppDeploy.sh")
}
