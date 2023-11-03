provider "aws" {}

module "helm_release" {
  source  = "blackbird-cloud/aks-helm-release/azurerm"
  version = "~> 1"

  cluster_name        = "my-develop-cluster"
  resource_group_name = "my-resource-group"

  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  chart_version    = "44.4.1"
  namespace        = "prometheus"
  create_namespace = true

  values = [
    yamlencode({
      grafana : {
        enabled : false
      }
      prometheus : {
        prometheusSpec : {
          storageSpec : {
            volumeClaimTemplate : {
              spec : {
                storageClassName : "gp3"
                accessModes : ["ReadWriteOnce"]
                resources : {
                  requests : {
                    storage : "50Gi"
                  }
                }
              }
            }
          }
        }
      }
    })
  ]

  cleanup_on_fail = true
  force_update    = true
}
