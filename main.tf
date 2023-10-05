resource "aws_instance" "ec2_public_resource" {
  ami                    = data.aws_ami.app_ami.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_us_east_1["us-east-1a"].id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = "terraform_key"
  count                  = 1
  tags = {
    Name = "${var.ec2_public_subnet_name}-${count.index}"
  }
}

resource "aws_instance" "ec2_private_resource" {
  ami                    = data.aws_ami.app_ami.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_us_east_1["us-east-1a"].id
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  key_name               = "terraform_key"
  count                  = 1
  tags = {
    Name = "${var.ec2_private_subnet_name}-${count.index}"
  }
}