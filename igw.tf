resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.private_eip.id
  subnet_id     = aws_subnet.public_us_east_1["us-east-1a"].id

  tags = {
    Name = "NAT-gw"
  }

  # dependency to IGW to ensure proper ordering
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_eip" "private_eip" {
  domain = "vpc"
}