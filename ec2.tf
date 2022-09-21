#Create a new EC2 launch configuration
resource "aws_instance" "ec2-public" {
  ami                         = "ami-05fa00d4c63e32376"
  instance_type               = "t2.micro"
  key_name                    = "key"
  security_groups             = ["${aws_security_group.tf-sg.id}"]
  subnet_id                   = aws_subnet.tf-pub-sn-1.id
  associate_public_ip_address = true
  user_data                   = file("data.sh")

  tags = {
    Name = "EC2-PUBLIC"
  }
}
#Create a new EC2 launch configuration
resource "aws_instance" "vamsi-cc" {
  ami                         = "ami-05fa00d4c63e32376"
  instance_type               = "t2.micro"
  key_name                    = "key"
  security_groups             = ["${aws_security_group.tf-sg.id}"]
  subnet_id                   = aws_subnet.tf-pub-sn-2.id
  associate_public_ip_address = true
  user_data                   = file("data1.sh")


  tags = {
    Name = "vamsi-cc"
  }
}
