resource "aws_instance" "test1" {
  count = var.ec2_count
  ami = var.ami_id
  instance_type = var.instance_type
#  key_name = "tf-key"
# Security group association
# security_groups = [aws_security_group.TF-SG.name]
  
  tags = {
    Name = "test1-instance"
  }
  
}
