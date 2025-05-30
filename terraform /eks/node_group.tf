resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_my_cluster.name
  node_group_name = "eks_node_group"
  node_role_arn   = aws_iam_role.eks_group_nodes_role.arn
  subnet_ids      = var.eks_node_group_subnets_ids

  capacity_type = "ON_DEMAND"
  ami_type       = "AL2_x86_64"         
  instance_types = ["t2.medium"]
  disk_size = 20
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_group_node-AmazonEC2ContainerRegistryPullOnly,
    aws_iam_role_policy_attachment.eks_group_node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks_group_node-AmazonEKSWorkerNodePolicy,
  ]
}