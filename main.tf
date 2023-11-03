module "helm_release" {
  source  = "blackbird-cloud/deployment/helm"
  version = "1.2.2"

  name        = var.name
  description = var.description
  namespace   = var.namespace

  repository    = var.repository
  chart         = var.chart
  chart_version = var.chart_version

  create_namespace = var.create_namespace
  disable_webhooks = var.disable_webhooks

  repository_username = var.repository_username
  repository_password = var.repository_password

  cleanup_on_fail = var.cleanup_on_fail
  force_update    = var.force_update
  timeout         = var.timeout
  recreate_pods   = var.recreate_pods
  atomic          = var.atomic
  wait            = var.wait
  wait_for_jobs   = var.wait_for_jobs

  values = concat(var.values, var.sensitive_values)
}
