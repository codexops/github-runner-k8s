resource "aws_eks_addon" "kube_proxy" {
  cluster_name      = aws_eks_cluster.cluster.name
  addon_name        = var.addon_name_kube
  addon_version     = var.addon_version_kube
  resolve_conflicts = var.resolve_conflicts_name_kube
  depends_on = [
    aws_eks_node_group.node_group
  ]
}
resource "aws_eks_addon" "vpc_cni" {
  cluster_name      = aws_eks_cluster.cluster.name
  addon_name        = var.addon_name_vpc
  addon_version     = var.addon_version_cni
  resolve_conflicts = var.resolve_conflicts_name_vpc
  depends_on = [
    aws_eks_node_group.node_group
  ]
}
resource "aws_eks_addon" "core_dns" {
  cluster_name      = aws_eks_cluster.cluster.name
  addon_name        = var.addon_name_dns
  addon_version     = var.addon_version_dns
  resolve_conflicts = var.resolve_conflicts_name_dns
  depends_on = [
    aws_eks_node_group.node_group
  ]
}

