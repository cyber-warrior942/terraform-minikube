resource "kubernetes_horizontal_pod_autoscaler_v1" "hpa" {
  count = var.service_count

  metadata {
    name = "hpa-${count.index}"
  }

  spec {
    min_replicas = 1
    max_replicas = 5

    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = "service-${count.index}"
    }

    target_cpu_utilization_percentage = 50
  }
}
