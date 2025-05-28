output PublicSubnet_id {
  value       = aws_subnet.subnets_m["PublicSubnet"].id
}

output PrivateSubnet_id {
  value       = aws_subnet.subnets_m["PrivateSubnet"].id
}

output vpc_id {
  value       = aws_vpc.MyVPC.id
}

output master_sg {
  value       = aws_security_group.master_sg.id
}

