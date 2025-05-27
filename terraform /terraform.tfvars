vpc_cidr = "10.10.0.0/16"
region = "us-east-1"
instance_type = "t2.medium"
subnets = [
{
    cidr_block = "10.10.1.0/24"
    availability_zone = "us-east-1a"
    name = "PublicSubnet"
    type = "public"  
},
{
    cidr_block = "10.10.2.0/24"
    availability_zone = "us-east-1b"
    name = "PrivateSubnet"
    type = "private"  
}
]
