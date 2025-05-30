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
# module "rds" {
#   source = "./database"
#   rds_sg = module.mynetwork.networkOUT_SG_for_rds_id
#   rds_subnet_groups_ids = [ module.mynetwork.PrivateSubnet_id]  
#   rds_password_credentials = var.my_SM_rds_credentials["password"]
#   rds_username_credentials = var.my_SM_rds_credentials["username"]
# }
module "eks" {
  source = "./eks"
  eks_cluster_subnets_ids    = [module.mynetwork.PublicSubnet_id, module.mynetwork.PrivateSubnet_id]
  eks_node_group_subnets_ids = [module.mynetwork.PrivateSubnet_id] 
}

