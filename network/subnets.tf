resource "aws_subnet" "subnets_m" {
  for_each = { for subnet in var.subnets_m : subnet.name => subnet }
  vpc_id     = aws_vpc.MyVPC.id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone
  map_public_ip_on_launch  = each.value.type == "public" ? true : false
  tags = {
    Name = each.value.name
  }
}
