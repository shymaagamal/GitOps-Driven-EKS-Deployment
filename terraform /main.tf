module "mynetwork" {
    source = "./network"
    vpc_cidr_m = var.vpc_cidr
    region_m = var.region
    subnets_m = var.subnets
}

module "mycompute" {
    source = "./compute"
    instance_type_m = var.instance_type
    PublicSubnet_id_m= module.mynetwork.PublicSubnet_id
    master_sg_m= module.mynetwork.master_sg
}

module "eks" {
  source = "./eks"
  eks_cluster_subnets_ids    = [module.mynetwork.PublicSubnet_id, module.mynetwork.PrivateSubnet_id]
  eks_node_group_subnets_ids = [module.mynetwork.PrivateSubnet_id] 
}