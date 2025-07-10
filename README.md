# 🌐 Azure Terraform Infrastructure Modules

This repository contains modular and reusable Terraform code to provision a full Azure infrastructure stack. Each module represents a specific Azure resource, and the `Prod` module acts as the orchestrator by calling all child modules in a structured way.

## Repository Structure

```plaintext
.
├── .gitignore               # Git ignore file to exclude unnecessary files/folders
├── KV/                     # Azure Key Vault module
├── NIC/                    # Network Interface Card module (includes NIC, NSG, and NSG associations)
├── PIP/                    # Public IP module
├── Prod/                   # Parent module that orchestrates all child modules for production deployment
├── RG/                     # Resource Group module
├── SUBNET/                 # Subnet module (child of VNET)
├── VM/                     # Virtual Machine module
├── VNET/                   # Virtual Network module
```
---

## 📁 Folder & Module Overview

### `.gitignore`
Contains rules to exclude local state, build artifacts, and Terraform-generated files (like `.terraform/`, `.tfstate`, logs, and backup files) from version control to keep the repository clean and secure.

---

### `RG/` – 📦 Resource Group Module
Creates an Azure Resource Group. This is usually the first module to be called since other resources depend on a resource group.

---

### `VNET/` – 🌐 Virtual Network Module
Defines the Virtual Network for your infrastructure, providing a logical isolation boundary and IP address space for your Azure resources.

---

### `SUBNET/` – 🔌 Subnet Module
Creates one or more subnets within the VNET. It logically segments the VNET for better security and traffic control.

---

### `PIP/` – 🌍 Public IP Module
Provisions Public IP addresses for internet-facing resources such as VMs or Load Balancers.

---

### `NIC/` – 🔗 Network Interface Module
Creates a Network Interface Card (NIC) and associates it with:
- A subnet
- A Public IP (optional)
- A Network Security Group (NSG)

This module also includes:
- NSG creation
- NSG rule configuration
- NSG association with the NIC

---

### `VM/` – 🖥️ Virtual Machine Module
Deploys Azure Virtual Machines with the specified size, image, admin credentials, and networking components.

---

### `KV/` – 🔐 Key Vault Module
Creates an Azure Key Vault for managing secrets, certificates, and keys. Useful for securely storing sensitive information like passwords and connection strings. Add the KeyVault name on the **Prod/main.tf** and on **VM/data.tf**

---

### `Prod/` – 🚀 Parent Module
This is the **main execution point**. It calls and configures all the above child modules to deploy a complete, production-ready environment. All variables and outputs are consolidated here.

---

## 🛠️ How to Use

1. Navigate to the `Prod/` directory.
2. Configure your `terraform.tfvars` with all necessary variables.
3. Run the following commands:

```
terraform init
terraform plan
terraform apply
```
