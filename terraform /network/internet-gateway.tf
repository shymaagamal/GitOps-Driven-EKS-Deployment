resource "aws_internet_gateway" "IG" {
  vpc_id = aws_vpc.MyVPC.id
  tags = {
    Name = "IG"
  }
}