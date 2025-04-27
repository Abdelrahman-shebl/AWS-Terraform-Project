resource "aws_subnet" "Web1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "192.168.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Web1"
  }
}
resource "aws_subnet" "Web2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "192.168.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Web2"
  }
}
resource "aws_subnet" "jump" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "192.168.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "jump"
  }
}
resource "aws_subnet" "NAT-GW" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "192.168.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "NAT GW"
  }
}