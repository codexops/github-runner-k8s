resource "aws_eks_cluster" "cluster" {
  name                      = var.cluster_name
  role_arn                  = aws_iam_role.cluster.arn
  version                   = var.cluster_version
  enabled_cluster_log_types = var.cluster_enabled_log_types
  vpc_config {
    subnet_ids              = var.subnet_ids
    endpoint_private_access = var.cluster_endpoint_private_access
    endpoint_public_access  = var.cluster_endpoint_public_access
    public_access_cidrs     = var.cluster_endpoint_public_access_cidrs
    security_group_ids      = [aws_security_group.security_group.id]
  }
  kubernetes_network_config {
    service_ipv4_cidr = var.cluster_service_ipv4_cidr
    ip_family         = var.cluster_ip_family
  }
  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]
}
