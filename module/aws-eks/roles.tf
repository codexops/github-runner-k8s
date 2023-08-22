# cluster-role
resource "aws_iam_role" "cluster" {
  name               = var.cluster_role_name
  assume_role_policy = file("${path.module}/master_node_policy.json")
}
resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = data.aws_iam_policy.cluster_policy_arn.arn
  role       = aws_iam_role.cluster.name
}
resource "aws_iam_role" "node" {
  name               = var.node_role_name
  assume_role_policy = file("${path.module}/worker_node_policy.json")
}
resource "aws_iam_role_policy_attachment" "eks_worker_node_policy" {
  policy_arn = data.aws_iam_policy.worker_node_policy_arn.arn
  role       = aws_iam_role.node.name
}
resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
  policy_arn = data.aws_iam_policy.eks_cni_policy.arn
  role       = aws_iam_role.node.name
}
resource "aws_iam_role_policy_attachment" "eks_ecr_policy" {
  policy_arn = data.aws_iam_policy.ecr_read_only.arn
  role       = aws_iam_role.node.name
}

