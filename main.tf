module "microservices" {
  source        = "./modules/microservices"
  service_count = var.service_count
  replicas      = var.replicas
}

module "autoscaling" {
  source        = "./modules/autoscaling"
  service_count = var.service_count
}

module "secrets" {
  source = "./modules/secrets"
  # optional: api_key = "my-new-secret"
}
