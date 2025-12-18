variable "service_count" {
  description = "Number of microservices to deploy"
  type        = number
  default     = 15
}

variable "replicas" {
  description = "Number of replicas per microservice"
  type        = number
  default     = 1
}
