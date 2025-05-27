output EC2_PublicIP {
  value       = aws_instance.Master.public_ip
}
