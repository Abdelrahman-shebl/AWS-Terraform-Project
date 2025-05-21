# AWS Infrastructure Setup with Terraform

# [Architecture Diagram] ![image](https://github.com/user-attachments/assets/033029c2-5b53-49fa-ae5c-fdb5149d06e0)


## 🚀 Project Overview

This project provisions a highly available AWS infrastructure using **Terraform**, including:
- A **VPC** with public and private subnets across multiple **Availability Zones** (AZs)
- **Auto Scaling Group** for EC2 instances behind an **Application Load Balancer (ALB)**
- **Jump server** (Bastion host) to securely SSH into private instances
- **NAT Gateway** for private subnet internet access
- **S3 Bucket** with appropriate IAM policies
- Full **routing setup** (public and private route tables)
- Proper **IAM Roles** and **Security Groups**

---

## 🛠️ Technologies Used

- **Terraform** (~> 5.0)
- **AWS VPC, EC2, ALB, Auto Scaling Group, IAM, S3, NAT Gateway, Internet Gateway**

---

## 🏗️ Infrastructure Components

| Component         | Description                                                        |
|-------------------|--------------------------------------------------------------------|
| VPC               | Custom VPC (CIDR: 192.168.0.0/16)                                  |
| Subnets           | Public and private subnets spread across 2 AZs                     |
| ALB               | Application Load Balancer (Public Facing)                          |
| Auto Scaling      | EC2 Auto Scaling Group for high availability                       |
| NAT Gateway       | Provides internet access to private subnets                        |
| Jump Server       | Bastion host for SSH access (Port 22)                              |
| S3 Bucket         | Accessible by EC2 via IAM roles (Put/Get/List permissions)         |
| Security Groups   | Configured for SSH and HTTP access                                 |
| IAM Roles/Policies| EC2 access to S3 with least privilege principle                    |

---

## 📂 Project Structure

```bash
├── ALB.tf
├── ASG.tf
├── variables.tf
├── bastion.tf
├── IAM.tf
├── IGW.tf
├── key_pair.tf
├── NAT_GW.tf
├── provider.tf
├── routes.tf
├── s3.tf
├── SG.tf
├── subnet.tf
├── vpc.tf
├── README.md
└── architecture_diagram.png (this image)
```
---

## 🚦 How to Use This Terraform Project
Follow these steps to deploy and manage the infrastructure using Terraform:

### 🔐 AWS Configuration
Before proceeding, configure your AWS credentials:

```bash
aws configure
```
You'll need to provide:
- AWS Access Key ID
- AWS Secret Access Key
- Default region name
- Default output format

### 🔑 SSH Key Setup
Modify `key_pair.tf` to use your own public key:
1. Open `key_pair.tf` in a text editor
2. Replace the `public_key` value with your own public key path:
```hcl
resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2"
  public_key = file("path/to/public_key")  # ← Update this
}
```

### 1️⃣ Initialize the Project
Make sure [Terraform is installed](https://developer.hashicorp.com/terraform/downloads), then initialize the working directory:

```bash
terraform init
```

### 2️⃣ Preview the Execution Plan
Check what resources Terraform will create, update, or destroy without making any changes:

```bash
terraform plan
```

This helps you verify and review the proposed changes before applying them.

### 3️⃣ Apply the Configuration
Create or update infrastructure as defined in the .tf files:

```bash
terraform apply
```

You will be prompted to confirm the action. Type `yes` to proceed.

### 4️⃣ (Optional) Destroy the Infrastructure
If you want to tear down and remove all resources provisioned by this Terraform project:

```bash
terraform destroy
```
