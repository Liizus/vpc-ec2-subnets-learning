resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg-01"
  description = "Security Group made using Terraform"
  vpc_id      = aws_vpc.main.id

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

resource "aws_security_group" "private_sg" {
  name   = "private-sg"
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private-sg"
  }
}

resource "aws_security_group_rule" "ingress_ssh_traffic" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.private_sg.id
  source_security_group_id = aws_security_group.ec2_sg.id
  description              = "allow SSH from bastion host (public instance)"
}