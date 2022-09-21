resource "aws_route_table" "tf-rt" {
  vpc_id = aws_vpc.tf-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf-igw.id
  }


  tags = {
    Name = "tf-rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.tf-pub-sn-1.id
  route_table_id = aws_route_table.tf-rt.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.tf-pub-sn-2.id
  route_table_id = aws_route_table.tf-rt.id
}
