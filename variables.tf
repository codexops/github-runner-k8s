variable "region" {
  type        = string
  description = "region in which resources is being created"
  default     = "us-east-1"
}
variable "cluster_version" {
  type        = string
  description = "version of cluster"
  default     = "1.22"
}
variable "cluster_role_name" {
  type        = string
  description = "name of the role which is attached to the cluster"
  default     = "eks-cluster-role"
}
variable "node_role_name" {
  type        = string
  description = "name of role which is attached to the nodes group"
  default     = "worker-node-role"
}
variable "cluster_name" {
  type        = string
  description = "name of the cluster"
  default     = "k8s-cluster"
}
variable "subnet_ids" {
  type        = list(string)
  description = "subnet in which cluster is being created"
}
variable "cluster_endpoint_private_access" {
  type        = bool
  description = "private accessibilty of cluster endpoint"
  default     = false
}
variable "cluster_endpoint_public_access" {
  type        = bool
  description = "public accessibilty of cluster endpoint"
  default     = true
}
variable "cluster_endpoint_public_access_cidrs" {
  type        = list(string)
  description = "public cidr block which access cluster public endpoint"
  default     = ["0.0.0.0/0"]
}
variable "cluster_service_ipv4_cidr" {
  type        = string
  description = "cidr from which ip assign to the pod and service of the cluser"
  default     = "10.0.0.0/16"
}
variable "cluster_ip_family" {
  type        = string
  description = "ip families related to ipv4"
  default     = "ipv4"
}
variable "cluster_enabled_log_types" {
  description = "A list of the desired control plane logs to enable"
  type        = list(string)
  default     = ["audit", "api", "authenticator"]
}
variable "addon_name_kube" {
  type        = string
  description = "Enable service networking within your cluster."
  default     = "kube-proxy"
}
variable "addon_version_kube" {
  type        = string
  description = "add_on version of kube-proxy"
}
variable "resolve_conflicts_name_kube" {
  type        = string
  description = "type of resolve conflict to be added to the kube-proxy adds-on"
  default     = "OVERWRITE"
}
variable "addon_name_vpc" {
  type        = string
  description = "Enable pod networking within your cluster"
  default     = "vpc-cni"
}
variable "addon_version_cni" {
  type        = string
  description = "add_on version of vpc_cni"
}
variable "resolve_conflicts_name_vpc" {
  type        = string
  description = "type of resolve conflict to be added to the adds-on"
  default     = "OVERWRITE"
}
variable "addon_name_dns" {
  type        = string
  default     = "coredns"
  description = "Enable service discovery within your cluster."
}
variable "addon_version_dns" {
  type        = string
  description = "add_on version of core dns"
}
variable "resolve_conflicts_name_dns" {
  type        = string
  description = "type of resolve conflict to be added to the core-dns adds-on "
  default     = "OVERWRITE"
}
variable "node_group_name" {
  type        = string
  description = "node group name of the cluster"
  default     = "worker-nodes"
}
variable "desired_size" {
  type        = number
  description = "number of worker node required"
  default     = 1
}
variable "max_size" {
  type        = number
  description = "maximum number of worker node required"
  default     = 1
}
variable "min_size" {
  type        = number
  description = " mininum number of worker node required"
  default     = 1
}
variable "ami_type" {
  type        = string
  description = "ami-type of the ec2 which acts as as worker node"
  default     = "AL2_x86_64"
}
variable "capacity_type" {
  type        = string
  description = "capacity type required"
  default     = "ON_DEMAND"
}
variable "disk_size" {
  type        = number
  description = "disk size reuired for the worker nodes"
  default     = 20
}
variable "instance_type" {
  type        = string
  description = "instance type of ec2 which acts as a worker nodes"
  default     = "t3.medium"
}

variable "cert_release_name" {
  type        = string
  description = "release name of cert-manager"
  default     = "cert-release"
}
variable "cert_chart_name" {
  type        = string
  description = "chart name"
  default     = "cert-manager"
}
variable "create_namespace" {
  type        = bool
  description = "enabling namespace"
  default     = true
}
variable "cert_repository_name" {
  type        = string
  description = "repository name of cert-manager"
  default     = "https://charts.jetstack.io"
}
variable "cert_namespace" {
  type        = string
  description = "namespace in which cert-manager is working"
  default     = "cert-manager"
}
variable "custom_resource_definition" {
  type        = string
  description = "custom reourec definition"
  default     = "installCRDs"
}
variable "enable_crd" {
  type        = bool
  description = "install crd yes or no"
  default     = true
}
variable "runner_release_name" {
  type        = string
  description = "runner release name for action runner controller"
  default     = "arc"
}
variable "runner_chart_name" {
  type        = string
  description = "chart name of action-runner-controller"
  default     = "actions-runner-controller"
}
variable "runner_repo_name" {
  type        = string
  description = "runner repo where chart is going to be installed"
  default     = "https://actions-runner-controller.github.io/actions-runner-controller"
}
variable "runner_namespace" {
  type        = string
  description = "namespace in which arc is working"
  default     = "actions-runner-system"
}
variable "auth_token" {
  type        = string
  description = "authorization type"
  default     = "authSecret.github_token"
}
variable "github_token" {
  type        = string
  description = "github personal access token"
}
variable "auth_create" {
  type        = string
  default     = "authSecret.create"
  description = "it allow us to create secret or not"
}
variable "auth_create_or_not" {
  type        = bool
  default     = true
  description = "it will create secret after enabling it otherwise it will not create secret"
}
## security group details
##============================
variable "inbound_traffic_cidr" {
  type        = string
  description = "allow inbound traffic to the eks cluster"
  default     = "0.0.0.0/0"
}
variable "egress_traffic_cidr" {
  type        = string
  description = "allow outboound traffic to the eks cluster"
  default     = "0.0.0.0/0"
}
variable "inbound_ports" {
  type = list(object({
    port     = number
    protocol = string
  }))
  description = "port and protocol that is used to the eks cluster"
  default = [{
    port     = 22
    protocol = "TCP"
  }]
}
variable "outbound_ports" {
  type = list(object({
    port     = number
    protocol = string
  }))
  description = "port and protocol that is used to the eks cluster"
  default = [{
    port     = 0
    protocol = "-1"
  }]
}

