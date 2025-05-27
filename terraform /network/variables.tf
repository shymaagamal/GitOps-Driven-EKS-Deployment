variable vpc_cidr_m {
  type        = string
  description = "CIDR block of VPC"
}
variable region_m {
  type        = string
  default     = "us-east-1"
}
variable subnets_m {
  type = list(object({
    cidr_block = string
    availability_zone = string
    name = string
    type = string 
  }))
}
