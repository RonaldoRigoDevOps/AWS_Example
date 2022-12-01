resource "tls_private_key" "MyLab_PK" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "MyLab_KP" {
  key_name   = "MyLab_KP"
  public_key = tls_private_key.MyLab_PK.public_key_openssh
}