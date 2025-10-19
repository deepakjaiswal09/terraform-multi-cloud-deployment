# 🚀 DevOps Project – Multi-Cloud Infrastructure Automation with Terraform, AWS & GCP

## 🧩 Overview
This project demonstrates a multi-cloud infrastructure automation workflow using Terraform to provision identical NGINX web servers on AWS EC2 and GCP Compute Engine simultaneously.
Terraform is also configured with an AWS S3 remote backend for secure and versioned state management.
This project was implemented as part of a DevOps internship, focusing on Infrastructure as Code (IaC), cloud provisioning, and multi-cloud automation best practices.

## 📌 Objective

-Build and automate a multi-cloud deployment setup where:
-Terraform provisions identical NGINX servers on both AWS and GCP.
-All infrastructure configurations are managed from a single Terraform codebase.
-State files are stored securely in an AWS S3 bucket for remote backend management.
-Modules are used to ensure reusability and scalability.

## 🛠 Tools & Services

-Terraform – Infrastructure as Code tool
-AWS EC2 – Virtual server for hosting NGINX
-GCP Compute Engine – Virtual machine for hosting NGINX
-AWS S3 – Remote backend for Terraform state storage
-Ansible (optional) – For further automation extensibility
-VS Code & PowerShell – Development and execution environment

## 📂 Project Structure

```
multi-cloud-deployment-tf/
│
├── modules/
│   ├── aws_instance/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── gcp_instance/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── main.tf                     # Root configuration calling both modules
├── providers.tf                # AWS & GCP provider setup
├── variables.tf                # Global input variables
├── outputs.tf                  # Public IP outputs from both clouds
├── terraform.tfvars            # Variable values (excluded via .gitignore)
└── .gitignore                  # Security exclusions (tfstate, credentials)

```

## 🚀 Steps Performed

### 1️⃣ Configure AWS & GCP Providers

-Created an IAM user in AWS with least-privilege policies and generated access keys.
-Created a GCP service account with Compute Admin role and downloaded its JSON key file.
-Configured providers in providers.tf for both clouds.

📸 Screenshot 1: Provider configuration in Terraform



### 2️⃣ Setup S3 Backend

-Created an S3 bucket manually using AWS CLI for storing Terraform remote state:
```
aws s3api create-bucket --bucket multi-cloud-terraform-state-1 --region us-east-1
```

-Enabled versioning for recoverability.
-Initialized backend with:
```
terraform init -reconfigure
```
📸 Screenshot 2: S3 bucket showing infra/terraform.tfstate file

### 3️⃣ Terraform Modules Implementation

-Created separate reusable modules for AWS and GCP.
-Defined EC2 and Compute Engine resources with NGINX installation via remote-exec provisioners.
-Used root main.tf to call both modules in one run.

📸 Screenshot 3: VS Code project structure with modules and backend folders


### 4️⃣ Execution Workflow

-Commands executed in sequence:
```
terraform init
terraform plan
terraform apply -auto-approve
```
📸 Screenshot 4: terraform apply showing success output with both public IPs


### 5️⃣ Verify Deployment

-Confirmed EC2 instance running in AWS Console.
-Confirmed Compute Engine VM running in GCP Console.
-Verified NGINX server hosted successfully on both via public IPs.

📸 Screenshot 5: NGINX web pages hosted across AWS & GCP

## ⚡ Challenges & Solutions

• S3 backend not auto-created → created manually via AWS CLI before initialization.
• PowerShell syntax errors → resolved using backtick () instead of backslash (`).
• GCP JSON key mismatch → regenerated proper service account key.
• AMI region conflict → used global Amazon Linux 2 AMI for compatibility.

## 🎯 Outcome

✅ One Terraform apply deployed identical infrastructure across AWS & GCP.
✅ Secure & versioned remote state maintained in AWS S3.
✅ Modular architecture allowing easy scaling to more providers.
✅ End-to-End Infrastructure as Code with zero manual provisioning.

## 🧠 Key Learnings

-Cross-cloud infrastructure provisioning using a unified Terraform configuration.
-Secure handling of state and credentials in real-world deployments.
-Importance of backend versioning for collaboration and rollback.
-Error handling and debugging in PowerShell and GCP integrations.

## ✅ Acknowledgement

I successfully completed this DevOps internship project by implementing a production-grade multi-cloud infrastructure automation using Terraform, AWS, GCP, and AWS S3.
Key learnings include modular Infrastructure as Code (IaC) design, secure state management with S3 backends, multi-provider cloud provisioning, credential security, and cross-cloud orchestration through a single Terraform workflow.

## 🤝 Contributing

Contributions, feedback, or suggestions for improvement are welcome!
Feel free to fork the repo, open an issue, or submit a pull request.

## 🏷️ Tags

Terraform AWS GCP DevOps CloudComputing InfrastructureAsCode Automation S3 NGINX MultiCloud IaC
