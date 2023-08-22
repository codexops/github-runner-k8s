# cluster details
region                               = "us-east-1"
cluster_role_name                    = "eks-cluster-role"
node_role_name                       = "worker-node-role"
cluster_name                         = "ranjan-cluster"
subnet_ids                           = ["subnet-0041bbf3487ac2164", "subnet-0d402e7fa7c98d634"]
cluster_enabled_log_types            = ["controllerManager", "scheduler", "audit", "api", "authenticator"]
cluster_version                      = "1.23"
cluster_endpoint_public_access       = true
cluster_endpoint_private_access      = false
cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
cluster_service_ipv4_cidr            = "10.0.0.0/16"
cluster_ip_family                    = "ipv4"
addon_name_kube                      = "kube-proxy"
addon_version_kube                   = "v1.23.16-eksbuild.2"
resolve_conflicts_name_kube          = "OVERWRITE"
addon_name_vpc                       = "vpc-cni"
addon_version_cni                    = "v1.12.6-eksbuild.1"
resolve_conflicts_name_vpc           = "OVERWRITE"
addon_name_dns                       = "coredns"
addon_version_dns                    = "v1.8.7-eksbuild.4"
resolve_conflicts_name_dns           = "OVERWRITE"
node_group_name                      = "worker_nodes"
desired_size                         = 2
max_size                             = 2
min_size                             = 2
ami_type                             = "AL2_x86_64"
capacity_type                        = "ON_DEMAND"
disk_size                            = 20
instance_type                        = "t3.medium"
inbound_traffic_cidr                 = "0.0.0.0/0"
egress_traffic_cidr                  = "0.0.0.0/0"
inbound_ports = [
  { port = 22, protocol = "TCP" },
  { port = 80, protocol = "TCP" },
  { port = 443, protocol = "TCP" }
]
outbound_ports = [
  { port = 0, protocol = "-1" }
]

# helm details
cert_release_name          = "cert-release"
cert_chart_name            = "cert-manager"
create_namespace           = true
cert_repository_name       = "https://charts.jetstack.io"
cert_namespace             = "cert-manager"
custom_resource_definition = "installCRDs"
enable_crd                 = true
runner_release_name        = "arc"
runner_chart_name          = "actions-runner-controller"
runner_repo_name           = "https://actions-runner-controller.github.io/actions-runner-controller"
runner_namespace           = "actions-runner-system"
auth_create                = "authSecret.create"
auth_create_or_not         = true
auth_token                 = "authSecret.github_token"
github_token               = "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"

