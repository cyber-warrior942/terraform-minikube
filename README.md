Project: Terraform + Minikube Microservices Deployment

Objective: Deploy a scalable microservice platform (15+ containers) with modular Terraform, auto-scaling, zero-downtime updates, and zero-trust security, ready for multi-cloud extension.

| Requirement                | Implementation                                                               |
| -------------------------- | ---------------------------------------------------------------------------- |
| 15+ Microservices          | Deployed via `modules/microservices` (Nginx pods)                            |
| Modular Terraform Design   | Separate modules: microservices, autoscaling, secrets; provider-agnostic     |
| Auto-Scaling (50× traffic) | Horizontal Pod Autoscaler (HPA) monitors CPU and scales pods                 |
| Zero-Downtime Updates      | Kubernetes self-healing recreates pods automatically                         |
| Zero-Trust Secrets         | `modules/secrets` manages API keys securely; supports rotation               |
| Chaos Testing / Failover   | Pod deletion test confirms automatic recovery                                |
| CI/CD Pipeline             | GitHub Actions workflow: `terraform init` + `terraform plan` on push/PR      |
| Multi-Cloud Readiness      | Provider abstraction allows AWS, Azure, OpenStack deployment                 |
| Cost Optimization          | Local Minikube ensures zero cloud cost while demonstrating full architecture |
| Performance & Scalability  | Easily scales from 15 → 50+ pods; HPA handles dynamic load                   |
| State Management           | Terraform state files ensure reproducibility and rollback capability         |

Usage (Quick Start)

# Start Minikube
```
minikube start --driver=docker --cpus=4 --memory=8192
```
# Initialize and deploy Terraform
```
cd ~/terraform-minikube
terraform init
terraform apply
```
# Verify deployment
```
kubectl get pods
kubectl get hpa
```
# Chaos test
```
kubectl delete pod service-3-xxxxx
```
# Pod auto-recreated → zero downtime

# CI/CD Integration

GitHub Actions workflow triggers on push or pull request to main.
Automatically runs:

```
terraform init
terraform plan
```
Optional: terraform apply can be enabled manually.
