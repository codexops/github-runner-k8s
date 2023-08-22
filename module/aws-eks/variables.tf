##========================
## cluster details
##========================
variable "cluster_name" {
  type        = string
  description = "name of the cluster"
  default     = "k8s-cluster"
}
variable "cluster_version" {
  type        = string
  description = "version of cluster"
  default     = "1.22"
}
variable "cluster_enabled_log_types" {
  description = "A list of the desired control plane logs to enable"
  type        = list(string)
  default     = ["audit", "api", "authenticator", "controllerManager", "scheduler"]
}
variable "subnet_ids" {
  type        = list(string)
  description = "subnet in which cluster is being created"
  default     = []
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
##============================
## node groups details
##============================
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
# variable "launch_template_name" {
#   type        = string
#   description = "name of the launch template"
#   default     = "launch_template"
# }
# variable "launch_template_version" {
#   type        = number
#   description = "version of the launch template used in node groups"
#   default     = 1
# }
##============================
## role used for cluster and workernode
##============================
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
