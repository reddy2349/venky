resource "aws_subnet" "tf-pub-sn-1" {
  vpc_id                  = aws_vpc.tf-vpc.id
  cidr_block              = "192.168.100.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"
  tags = {
    Name = "tf-pub-sn-1"
  }
}


resource "aws_subnet" "tf-pub-sn-2" {
  vpc_id                  = aws_vpc.tf-vpc.id
  cidr_block              = "192.168.200.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"
  tags = {
    Name = "tf-pub-sn-2"
  }
}
