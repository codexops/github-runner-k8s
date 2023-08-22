data "aws_iam_policy" "cluster_policy_arn" {
  name = "AmazonEKSClusterPolicy"
}
data "aws_iam_policy" "worker_node_policy_arn" {
  name = "AmazonEKSWorkerNodePolicy"
}
data "aws_iam_policy" "eks_cni_policy" {
  name = "AmazonEKS_CNI_Policy"
}
data "aws_iam_policy" "ecr_read_only" {
  name = "AmazonEC2ContainerRegistryReadOnly"
}

