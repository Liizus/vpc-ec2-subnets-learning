resource "aws_subnet" "public_us_east_1" {
  vpc_id                  = aws_vpc.main.id
  for_each                = var.vpc_public_subnet
  cidr_block              = each.value["subnet_cidr"]
  availability_zone       = each.value["subnet_az"]
  map_public_ip_on_launch = true

  tags = each.value["tags"]
}

resource "aws_subnet" "private_us_east_1" {
  vpc_id                  = aws_vpc.main.id
  for_each                = var.vpc_private_subnet
  cidr_block              = each.value["subnet_cidr"]
  availability_zone       = each.value["subnet_az"]
  map_public_ip_on_launch = false

  tags = each.value["tags"]
}