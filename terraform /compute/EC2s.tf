resource "aws_instance" "Master" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type_m
  subnet_id =  var.PublicSubnet_id_m
  associate_public_ip_address = true
  vpc_security_group_ids = [var.master_sg_m]
  key_name = aws_key_pair.generated_key.key_name
  tags = {
    Name = "Master"
  }
}

resource "aws_instance" "Slave" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type_m
  subnet_id = var.PrivateSubnet_id_m
  vpc_security_group_ids = [var.slave_sg_m]
  key_name = aws_key_pair.generated_key.key_name    
  tags = {
    Name = "Slave"
  }
}
