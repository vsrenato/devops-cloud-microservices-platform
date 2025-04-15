# DevOps Cloud Microservices Platform 🚀

Projeto de exemplo para demonstração de habilidades em DevOps, Kubernetes, Cloud (AWS), CI/CD, IaC e observabilidade. Composto por dois microserviços em Flask conectando-se a um banco de dados PostgreSQL (RDS).

---

## 🔧 Tecnologias Utilizadas

- **Containers:** Docker
- **Orquestração:** Kubernetes (EKS) e (GKE)
- **Cloud:** AWS && GCP
- **CI/CD:** GitHub Actions + ArgoCD
- **Infraestrutura como Código:** Terraform, Ansible, Kustomize
- **Banco de Dados:** PostgreSQL (via RDS AWS)
- **Linguagem Backend:** Python (Flask)

---

## Como executar localmente com Docker

# bash

# Service A
cd app/service-a
docker build -t service-a .
docker run -p 5000:5000 --env-file ../../.env service-a

# Service B
cd ../service-b
docker build -t service-b .
docker run -p 5001:5000 --env-file ../../.env service-b

---

## 📁 Estrutura do Projeto

```bash
devops-cloud-microservices-platform/
├── app/                  # Microserviços Flask (service-a, service-b)
├── k8s/                  # Manifests Kubernetes (base, dev, prod)
├── terraform/            # IaC para EKS, GKE e RDS
├── .github/workflows/    # CI com GitHub Actions
├── argo-cd/              # ArgoCD Application config             
├── docs/                 # Arquitetura e diagramas
└── README.md