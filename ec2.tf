resource "aws_instance" "MyLab_Project1" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = "mylab" #aws_key_pair.MyLab_KP.key_name
  vpc_security_group_ids      = [aws_security_group.MyLab_Project1_SG.name]
  associate_public_ip_address = true
  tags = {
    Name = "MyLab_Project1"
  }
  user_data = file("AppDeploy.sh")
}
