resource "aws_vpc" "main" {
  cidr_block       = "10.143.128.0/27"
  instance_tenancy = "default"

  tags = {
    Name = "breedinginsight-vpc"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}
resource "aws_subnet" "public-sub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.143.128.32/27"

  tags = {
    Name = "public-sub"
  }
}
resource "aws_subnet" "private-sub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.143.128.64/27"

  tags = {
    Name = "private-sub"
  }
}


  
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "breedinginsight-sg"
  }
}


