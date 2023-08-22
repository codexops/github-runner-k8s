# helm

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.cert_manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.github_runner](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auth_create"></a> [auth\_create](#input\_auth\_create) | it allow us to create secret or not | `string` | `"authSecret.create"` | no |
| <a name="input_auth_create_or_not"></a> [auth\_create\_or\_not](#input\_auth\_create\_or\_not) | it will create secret after enabling it otherwise it will not create secret | `bool` | `true` | no |
| <a name="input_auth_token"></a> [auth\_token](#input\_auth\_token) | authorization type | `string` | `"authSecret.github_token"` | no |
| <a name="input_cert_chart_name"></a> [cert\_chart\_name](#input\_cert\_chart\_name) | chart name | `string` | `"cert-manager"` | no |
| <a name="input_cert_namespace"></a> [cert\_namespace](#input\_cert\_namespace) | namespace in which cert-manager is working | `string` | `"cert-manager"` | no |
| <a name="input_cert_release_name"></a> [cert\_release\_name](#input\_cert\_release\_name) | release name of cert-manager | `string` | `"cert-release"` | no |
| <a name="input_cert_repository_name"></a> [cert\_repository\_name](#input\_cert\_repository\_name) | repository name of cert-manager | `string` | `"https://charts.jetstack.io"` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | enabling namespace | `bool` | `true` | no |
| <a name="input_custom_resource_definition"></a> [custom\_resource\_definition](#input\_custom\_resource\_definition) | custom reourec definition | `string` | `"installCRDs"` | no |
| <a name="input_enable_crd"></a> [enable\_crd](#input\_enable\_crd) | install crd yes or no | `bool` | `true` | no |
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | github personal access token | `string` | n/a | yes |
| <a name="input_runner_chart_name"></a> [runner\_chart\_name](#input\_runner\_chart\_name) | chart name of action-runner-controller | `string` | `"actions-runner-controller"` | no |
| <a name="input_runner_namespace"></a> [runner\_namespace](#input\_runner\_namespace) | namespace in which arc is working | `string` | `"actions-runner-system"` | no |
| <a name="input_runner_release_name"></a> [runner\_release\_name](#input\_runner\_release\_name) | runner release name for action runner controller | `string` | `"arc"` | no |
| <a name="input_runner_repo_name"></a> [runner\_repo\_name](#input\_runner\_repo\_name) | runner repo where chart is going to be installed | `string` | `"https://actions-runner-controller.github.io/actions-runner-controller"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
