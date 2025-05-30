resource "aws_security_group" "master_sg" {
  name        = "master_sg"
  vpc_id      = aws_vpc.MyVPC.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "network_SG_for_rds" {
  name        = "rds_security_group"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.MyVPC.id

  tags = {
    Name = "rds_security_group"
  }
}
resource "aws_vpc_security_group_ingress_rule" "rds_ingress_from_eks" {
  security_group_id = aws_security_group.network_SG_for_rds.id
  cidr_ipv4 = "10.10.2.0/24"
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
}
