variable vpc_cidr {
  type        = string
  description = "CIDR block of VPC"
}
variable region {
  type        = string
  default     = "us-east-1"
}
variable instance_type {
  type        = string
  description = "instance_type of VMS"
}
variable subnets {
  type = list(object({
    cidr_block = string
    availability_zone = string
    name = string
    type = string 
  }))
}
