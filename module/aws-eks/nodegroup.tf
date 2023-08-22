resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = var.subnet_ids
  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

# launch_template {
#   name    = aws_launch_template.your_eks_launch_template.name
#   version = aws_launch_template.your_eks_launch_template.latest_version
# }

  ami_type       = var.ami_type      # AL2_x86_64, AL2_x86_64_GPU, AL2_ARM_64, CUSTOM
  capacity_type  = var.capacity_type # ON_DEMAND, SPOT
  disk_size      = var.disk_size
  instance_types = [var.instance_type]

  depends_on = [
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.eks_ecr_policy,
    aws_iam_role_policy_attachment.eks_worker_node_policy,
  ]
}
