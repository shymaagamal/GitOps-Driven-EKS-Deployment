resource "aws_route_table" "privtable" {
  vpc_id = aws_vpc.MyVPC.id
   route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natGateway.id
  }
  tags = {
    Name = "privtable"
  }
}

resource "aws_route_table_association" "private_route_association" {
  subnet_id      = aws_subnet.subnets_m["PrivateSubnet"].id
  route_table_id = aws_route_table.privtable.id
}
