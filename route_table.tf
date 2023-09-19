resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-ec2"
  }
}

resource "aws_route_table_association" "public_us_east_1" {
  for_each       = aws_subnet.public_us_east_1
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}