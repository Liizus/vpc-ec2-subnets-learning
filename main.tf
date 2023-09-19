resource "aws_instance" "ec2_resource" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
  key_name      = "terraform_key"
  count         = 1
  tags = {
  Name = "${var.ec2_public_subnet_name}-${count.index}" 
  }
}