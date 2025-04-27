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

⚙️ How to Use Clone the repo: bash git clone
https://github.com/your-username/your-repo-name.git cd your-repo-name
Initialize Terraform: bash terraform init Plan the Deployment: bash
terraform plan Apply the Configuration: bash terraform apply 🌐 Access
Use SSH to connect to the Jump server

Access the web servers via the Load Balancer DNS name

🔐 Security Considerations Jump server restricted to SSH (port 22)

Web servers allow only HTTP (port 80)

Private instances access the internet via a NAT Gateway, not directly
through the Internet Gateway (IGW)

S3 Bucket access is restricted via IAM roles

📋 Notes Update your SSH key at Jump.pub before deployment

Ensure your AWS credentials are configured locally

Modify the region or instance types in variables.tf if needed
