resource "kubernetes_secret" "app_secret" {
  metadata {
    name = "app-secret"
  }

  data = {
    api_key = base64encode("initial-secret-key")
  }

  type = "Opaque"
}
