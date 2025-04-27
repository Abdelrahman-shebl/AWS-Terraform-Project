resource "aws_nat_gateway" "NAT" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.NAT-GW.id

  tags = {
    Name = "gw NAT"
  }
}


resource "aws_eip" "nat" {
  tags = {
    Name = "nat-eip"
  }
}