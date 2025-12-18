resource "kubernetes_deployment" "service" {
  count = var.service_count

  metadata {
    name = "service-${count.index}"
    labels = {
      app = "service-${count.index}"
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = "service-${count.index}"
      }
    }

    template {
      metadata {
        labels = {
          app = "service-${count.index}"
        }
      }

      spec {
        container {
          name  = "container-${count.index}"
          image = "nginx:latest"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "200m"
              memory = "256Mi"
            }
            requests = {
              cpu    = "100m"
              memory = "128Mi"
            }
          }
        }
      }
    }
  }
}
