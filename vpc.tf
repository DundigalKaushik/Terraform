resource "aws_vpc" "main-1" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "breeding1-vpc"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.main-1.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id            = aws_vpc.main-1.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_internet_gateway" "igw-1" {
  vpc_id = aws_vpc.main-1.id

  tags = {
    Name = "igw"
  }
}

resource "aws_route_table" "main-rtb" {
  vpc_id = aws_vpc.main-1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-1.id
  }

  
  tags = {
    Name = "main-rtb"
  }
}

resource "aws_route_table_association" "main-rtb-a" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.main-rtb.id
}

resource "aws_security_group" "web-sg" {
  name   = "HTTP and SSH"
  vpc_id = aws_vpc.main-1.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}
