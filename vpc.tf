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

esource "aws_internet_gateway" "igw-1" {
  vpc_id = aws_vpc.main-1.id

  tags = {
    Name = "igw"
  }
}
