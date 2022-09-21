resource "aws_key_pair" "deployer" {
  key_name   = "key"
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "deployer" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "key"
}
