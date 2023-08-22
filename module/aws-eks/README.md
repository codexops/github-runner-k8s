# aws-eks

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_addon.core_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.kube_proxy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.vpc_cni](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.node_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.node](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.eks_cluster_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_cni_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_ecr_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_worker_node_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_security_group.security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_iam_policy.cluster_policy_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.ecr_read_only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.eks_cni_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.worker_node_policy_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addon_name_dns"></a> [addon\_name\_dns](#input\_addon\_name\_dns) | Enable service discovery within your cluster. | `string` | `"coredns"` | no |
| <a name="input_addon_name_kube"></a> [addon\_name\_kube](#input\_addon\_name\_kube) | Enable service networking within your cluster. | `string` | `"kube-proxy"` | no |
| <a name="input_addon_name_vpc"></a> [addon\_name\_vpc](#input\_addon\_name\_vpc) | Enable pod networking within your cluster | `string` | `"vpc-cni"` | no |
| <a name="input_addon_version_cni"></a> [addon\_version\_cni](#input\_addon\_version\_cni) | add\_on version of vpc\_cni | `string` | n/a | yes |
| <a name="input_addon_version_dns"></a> [addon\_version\_dns](#input\_addon\_version\_dns) | add\_on version of core dns | `string` | n/a | yes |
| <a name="input_addon_version_kube"></a> [addon\_version\_kube](#input\_addon\_version\_kube) | add\_on version of kube-proxy | `string` | n/a | yes |
| <a name="input_ami_type"></a> [ami\_type](#input\_ami\_type) | ami-type of the ec2 which acts as as worker node | `string` | `"AL2_x86_64"` | no |
| <a name="input_capacity_type"></a> [capacity\_type](#input\_capacity\_type) | capacity type required | `string` | `"ON_DEMAND"` | no |
| <a name="input_cluster_enabled_log_types"></a> [cluster\_enabled\_log\_types](#input\_cluster\_enabled\_log\_types) | A list of the desired control plane logs to enable | `list(string)` | <pre>[<br>  "audit",<br>  "api",<br>  "authenticator",<br>  "controllerManager",<br>  "scheduler"<br>]</pre> | no |
| <a name="input_cluster_endpoint_private_access"></a> [cluster\_endpoint\_private\_access](#input\_cluster\_endpoint\_private\_access) | private accessibilty of cluster endpoint | `bool` | `false` | no |
| <a name="input_cluster_endpoint_public_access"></a> [cluster\_endpoint\_public\_access](#input\_cluster\_endpoint\_public\_access) | public accessibilty of cluster endpoint | `bool` | `true` | no |
| <a name="input_cluster_endpoint_public_access_cidrs"></a> [cluster\_endpoint\_public\_access\_cidrs](#input\_cluster\_endpoint\_public\_access\_cidrs) | public cidr block which access cluster public endpoint | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_cluster_ip_family"></a> [cluster\_ip\_family](#input\_cluster\_ip\_family) | ip families related to ipv4 | `string` | `"ipv4"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | name of the cluster | `string` | `"k8s-cluster"` | no |
| <a name="input_cluster_role_name"></a> [cluster\_role\_name](#input\_cluster\_role\_name) | name of the role which is attached to the cluster | `string` | `"eks-cluster-role"` | no |
| <a name="input_cluster_service_ipv4_cidr"></a> [cluster\_service\_ipv4\_cidr](#input\_cluster\_service\_ipv4\_cidr) | cidr from which ip assign to the pod and service of the cluser | `string` | `"10.0.0.0/16"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | version of cluster | `string` | `"1.22"` | no |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | number of worker node required | `number` | `1` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | disk size reuired for the worker nodes | `number` | `20` | no |
| <a name="input_egress_traffic_cidr"></a> [egress\_traffic\_cidr](#input\_egress\_traffic\_cidr) | allow outboound traffic to the eks cluster | `string` | `"0.0.0.0/0"` | no |
| <a name="input_inbound_ports"></a> [inbound\_ports](#input\_inbound\_ports) | port and protocol that is used to the eks cluster | <pre>list(object({<br>    port     = number<br>    protocol = string<br>  }))</pre> | <pre>[<br>  {<br>    "port": 22,<br>    "protocol": "TCP"<br>  }<br>]</pre> | no |
| <a name="input_inbound_traffic_cidr"></a> [inbound\_traffic\_cidr](#input\_inbound\_traffic\_cidr) | allow inbound traffic to the eks cluster | `string` | `"0.0.0.0/0"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | instance type of ec2 which acts as a worker nodes | `string` | `"t3.medium"` | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | maximum number of worker node required | `number` | `1` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | mininum number of worker node required | `number` | `1` | no |
| <a name="input_node_group_name"></a> [node\_group\_name](#input\_node\_group\_name) | node group name of the cluster | `string` | `"worker-nodes"` | no |
| <a name="input_node_role_name"></a> [node\_role\_name](#input\_node\_role\_name) | name of role which is attached to the nodes group | `string` | `"worker-node-role"` | no |
| <a name="input_outbound_ports"></a> [outbound\_ports](#input\_outbound\_ports) | port and protocol that is used to the eks cluster | <pre>list(object({<br>    port     = number<br>    protocol = string<br>  }))</pre> | <pre>[<br>  {<br>    "port": 0,<br>    "protocol": "-1"<br>  }<br>]</pre> | no |
| <a name="input_resolve_conflicts_name_dns"></a> [resolve\_conflicts\_name\_dns](#input\_resolve\_conflicts\_name\_dns) | type of resolve conflict to be added to the core-dns adds-on | `string` | `"OVERWRITE"` | no |
| <a name="input_resolve_conflicts_name_kube"></a> [resolve\_conflicts\_name\_kube](#input\_resolve\_conflicts\_name\_kube) | type of resolve conflict to be added to the kube-proxy adds-on | `string` | `"OVERWRITE"` | no |
| <a name="input_resolve_conflicts_name_vpc"></a> [resolve\_conflicts\_name\_vpc](#input\_resolve\_conflicts\_name\_vpc) | type of resolve conflict to be added to the adds-on | `string` | `"OVERWRITE"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | subnet in which cluster is being created | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
