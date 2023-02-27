provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "test1" {
  count = var.ec2_count
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public-subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
#  key_name = "tf-key"
# Security group association
# security_groups = [aws_security_group.TF-SG.name]
  
  tags = {
    Name = "test1-instance"
  }
  
}
