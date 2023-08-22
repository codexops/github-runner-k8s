module "aws_eks" {
  source                               = "./module/aws-eks"
  cluster_version                      = var.cluster_version
  cluster_name                         = var.cluster_name
  subnet_ids                           = var.subnet_ids
  cluster_enabled_log_types            = var.cluster_enabled_log_types
  cluster_endpoint_public_access       = var.cluster_endpoint_public_access
  cluster_endpoint_private_access      = var.cluster_endpoint_private_access
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  cluster_service_ipv4_cidr            = var.cluster_service_ipv4_cidr
  cluster_ip_family                    = var.cluster_ip_family
  addon_name_kube                      = var.addon_name_kube
  addon_version_kube                   = var.addon_version_kube
  resolve_conflicts_name_kube          = var.resolve_conflicts_name_kube
  addon_name_vpc                       = var.addon_name_vpc
  addon_version_cni                    = var.addon_version_cni
  resolve_conflicts_name_vpc           = var.resolve_conflicts_name_vpc
  addon_name_dns                       = var.addon_name_dns
  addon_version_dns                    = var.addon_version_dns
  resolve_conflicts_name_dns           = var.resolve_conflicts_name_dns
  node_group_name                      = var.node_group_name
  desired_size                         = var.desired_size
  max_size                             = var.max_size
  min_size                             = var.min_size
  ami_type                             = var.ami_type
  capacity_type                        = var.capacity_type
  disk_size                            = var.disk_size
  instance_type                        = var.instance_type
  cluster_role_name                    = var.cluster_role_name
  node_role_name                       = var.node_role_name
  inbound_traffic_cidr                 = var.inbound_traffic_cidr
  egress_traffic_cidr                  = var.egress_traffic_cidr
  inbound_ports                        = var.inbound_ports
  outbound_ports                       = var.outbound_ports
}
data "aws_eks_cluster" "cluster" {
  depends_on = [
    module.aws_eks
  ]
  name = module.aws_eks.cluster_name
}
module "helm" {
  depends_on = [
    module.aws_eks
  ]
  source                     = "./module/helm"
  cert_release_name          = var.cert_release_name
  cert_chart_name            = var.cert_chart_name
  create_namespace           = var.create_namespace
  cert_repository_name       = var.cert_repository_name
  cert_namespace             = var.cert_namespace
  custom_resource_definition = var.custom_resource_definition
  enable_crd                 = var.enable_crd
  runner_release_name        = var.runner_release_name
  runner_chart_name          = var.runner_chart_name
  runner_repo_name           = var.runner_repo_name
  runner_namespace           = var.runner_namespace
  auth_create                = var.auth_create
  auth_create_or_not         = var.auth_create_or_not
  auth_token                 = var.auth_token
  github_token               = var.github_token
}
module "kube-manifest" {
  depends_on = [
    module.helm
  ]
  source = "./module/manifest-file"
}







