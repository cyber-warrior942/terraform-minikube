# Terraform + Minikube Microservices Deployment

## Overview
This repository contains a **modular Terraform project** to deploy **15+ microservices** using **Kubernetes (Minikube)**. The project demonstrates:

- Modular infrastructure as code (IaC) with Terraform
- Dynamic **auto-scaling** using Horizontal Pod Autoscaler (HPA)
- **Zero-downtime updates** and failover
- **Zero-trust secrets management** with Kubernetes Secrets
- Chaos testing (pod deletion and self-healing)
- Provider-agnostic design (ready for AWS, Azure, or OpenStack)

This setup is fully **local** and **zero-cost** using Minikube, ideal for academic assignments and testing.

---

## Project Structure

```
terraform-minikube/
│
├── main.tf # Root module invoking other modules
├── variables.tf # Root variables
├── providers.tf # Terraform Kubernetes provider
├── outputs.tf # Optional outputs
└── modules/
├── microservices/
│ ├── main.tf # Deployment of Nginx pods
│ └── variables.tf
├── autoscaling/
│ ├── main.tf # HPA configuration
│ └── variables.tf
└── secrets/
├── main.tf # Zero-trust secrets
└── variables.tf
```

---

## Prerequisites
- **Kali Linux VM** (or Linux system)
  - CPU: 4 cores
  - RAM: 8 GB
  - Disk: 40 GB
  - Virtualization enabled (VT-x / AMD-V)
- **Docker**
- **Minikube**
- **kubectl**
- **Terraform** (v1.6+ recommended)

---

## Setup Instructions

### 1. Update System
```bash
sudo apt update && sudo apt upgrade -y

2. Install Docker
sudo apt install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER
newgrp docker
docker ps   # Verify Docker is running

3. Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version --client

4. Install Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube
minikube version

5. Install Terraform
sudo apt install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update
sudo apt install terraform
terraform -v

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
```
terraform init
terraform plan
```
Optional: terraform apply can be enabled manually.
