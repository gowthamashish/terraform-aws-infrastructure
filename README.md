# Automated Multi-Tier AWS Infrastructure & CI/CD Pipeline

An Infrastructure as Code (IaC) project built using **Terraform, AWS (VPC, EC2, S3, DynamoDB), Docker, and GitHub Actions**. This repository automates the provisioning of a Multi-AZ AWS network architecture and containerized compute layer with an automated CI/CD validation pipeline.

---

## 🏛️ Architecture & Key Features

* **Multi-AZ Network Architecture:** Modular Terraform configurations provisioning a custom VPC (`10.0.0.0/16`) across multiple Availability Zones (`ap-south-1a`, `ap-south-1b`) with isolated Public and Private subnets, an Internet Gateway, Route Tables, and stateful Security Groups.
* **Containerized Compute & Remote State Management:** Provisions Amazon EC2 compute instances bootstrapped to run containerized web workloads via **Docker** (`nginx:alpine`), backed by **Amazon S3** remote state storage and **Amazon DynamoDB** state locking to prevent concurrent state conflicts.
* **Automated CI/CD Pipeline:** Integrated with **GitHub Actions** (`.github/workflows/terraform-ci.yml`) triggered automatically on Git commits and pull requests to execute `terraform fmt`, `terraform validate`, and `terraform plan` for reliable infrastructure delivery.

---

## 🛠️ Tech Stack
* **IaC:** HashiCorp Terraform
* **Cloud Provider:** AWS (VPC, Public/Private Subnets, IGW, EC2, Security Groups, S3, DynamoDB)
* **Containers:** Docker
* **CI/CD Automation:** GitHub Actions

---

## 📂 Repository Structure
```text
terraform-aws-infrastructure/
├── .github/workflows/
│   └── terraform-ci.yml   # Automated GitHub Actions CI/CD pipeline
├── provider.tf            # AWS provider & S3/DynamoDB remote state backend
├── variables.tf           # Parameterized Multi-AZ network & compute variables
├── main.tf                # Core VPC, Multi-AZ Subnets, Security Groups & Docker EC2
├── outputs.tf             # Exported resource IDs and endpoints
├── .gitignore             # Excludes local .terraform/ and state files
└── README.md              # Architecture and pipeline documentation

# 1. Initialize Terraform (local validation mode)
terraform init -backend=false

# 2. Check code formatting
terraform fmt -check

# 3. Validate configuration syntax
terraform validate

# 4. Preview execution plan (requires AWS credentials configured)
terraform plan