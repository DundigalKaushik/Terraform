resource "aws_vpc" "main-1" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "breeding1-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main-1.id
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "public-sub"
  }
}
