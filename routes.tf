resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.vpc.id

  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

}

resource "aws_route_table" "private_RT" {
  vpc_id = aws_vpc.vpc.id

}
resource "aws_route" "private_R" {
  route_table_id = aws_route_table.private_RT.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.NAT.id
}

resource "aws_route_table_association" "jump" {
  subnet_id      = aws_subnet.jump.id
  route_table_id = aws_route_table.public_RT.id
}
resource "aws_route_table_association" "nat" {
  subnet_id      = aws_subnet.NAT-GW.id
  route_table_id = aws_route_table.public_RT.id
}

resource "aws_route_table_association" "web1" {
  subnet_id      = aws_subnet.Web1.id
  route_table_id = aws_route_table.private_RT.id
}

resource "aws_route_table_association" "Web2" {
  subnet_id      = aws_subnet.Web2.id
  route_table_id = aws_route_table.private_RT.id
}
