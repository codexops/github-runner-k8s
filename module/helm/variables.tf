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
variable "auth_token" {
  type        = string
  description = "authorization type"
  default     = "authSecret.github_token"
}
variable "github_token" {
  type        = string
  description = "github personal access token"
}


