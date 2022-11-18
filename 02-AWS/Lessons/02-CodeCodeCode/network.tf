

data aws_availability_zones "available" {
  state = "available"
}


resource "aws_vpc" "main" { 
  cidr_block = "172.31.0.0/16"
}

resource "aws_subnet" "example1" {
  vpc_id            = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }

  availability_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_subnet" "example2" {
    vpc_id            = aws_vpc.main.id
    cidr_block = "172.31.0.0/20"
    # Import me 
    # tf import aws_subnet.example2 subnet-0461d13501db81cdf
}


resource "aws_security_group" "example1" {
  vpc_id = aws_vpc.main.id
}

resource "aws_security_group" "example2" {
  
}