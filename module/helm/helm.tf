resource "helm_release" "cert_manager" {
  name             = var.cert_release_name
  chart            = var.cert_chart_name
  create_namespace = var.create_namespace
  repository       = var.cert_repository_name
  namespace        = var.cert_namespace
  set {
    name  = var.custom_resource_definition
    value = var.enable_crd
  }
}
resource "helm_release" "github_runner" {
  depends_on = [
    helm_release.cert_manager
  ]
  create_namespace = var.create_namespace
  name             = var.runner_release_name
  chart            = var.runner_chart_name
  repository       = var.runner_repo_name
  namespace        = var.runner_namespace
  set {
    name  = var.auth_create
    value = var.auth_create_or_not
  }
  set {
    name  = var.auth_token
    value = var.github_token
  }
}

