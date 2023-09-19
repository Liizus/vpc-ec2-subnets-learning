resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg-01"
  description = "Security Group made using Terraform"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.cidr_addressname
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidr_address_ssh
  }

  egress {
    description = "public internet access"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr_addressname
  }

  tags = {
    Name        = "ec2-sg-01"
    description = "Security group created via TF"
  }
}