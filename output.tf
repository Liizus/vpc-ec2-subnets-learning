output "ec2_public_ip" {
  value = aws_instance.ec2_public_resource[*].public_ip
}
output "ec2_private_ip" {
  value = aws_instance.ec2_private_resource[*].private_ip
}