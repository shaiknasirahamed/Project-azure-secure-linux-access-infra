# 📘 Project: Azure Secure Linux Access Infra

This project deploys a secure, identity‑centric access architecture for Linux virtual machines on Microsoft Azure, combining Azure Bastion, Microsoft Entra ID SSH login, RBAC, and Managed Identities. This approach aligns with modern cloud security practices such as passwordless access, zero public IP exposure, and least‑privilege admin control.  
(Referenced using Azure Bastion documentation [1](https://learn.microsoft.com/en-us/azure/bastion/), Azure Entra SSH login for Linux VMs [2](https://learn.microsoft.com/en-us/entra/identity/devices/howto-vm-sign-in-azure-ad-linux), Azure RBAC built‑in roles [3](https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles), and managed identities for Azure VMs [4](https://learn.microsoft.com/en-us/entra/identity/managed-identities-azure-resources/how-to-configure-managed-identities).)

---

## 🚀 Overview

This infrastructure implements a Zero‑Trust access model through:

- **Azure Bastion** — Secure SSH/RDP without public IPs.  
  (Bastion ensures private IP access over TLS via the Azure portal) [1](https://learn.microsoft.com/en-us/azure/bastion/)  
- **Microsoft Entra ID SSH login** — Certificate‑based login for Linux VMs.  
  (Entra ID certificate‑based OpenSSH login) [2](https://learn.microsoft.com/en-us/entra/identity/devices/howto-vm-sign-in-azure-ad-linux)  
- **RBAC‑controlled VM login** — Using `Virtual Machine User Login` and `Virtual Machine Administrator Login` roles.  
  [3](https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles)  
- **Managed Identities** — Secure identity for Azure resources without stored credentials.  
  (System‑assigned identities for VMs) [4](https://learn.microsoft.com/en-us/entra/identity/managed-identities-azure-resources/how-to-configure-managed-identities)

Optional integrations:

- **JumpHost with XRDP** — GUI-based remote access for admins.  
  (xrdp setup guidance on Linux VMs) [5](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/use-remote-desktop)  
- **Microsoft Entra Domain Services + SSSD** — LDAP/Kerberos-based login.  
  (Join Linux VM to Entra Domain Services) [6](https://learn.microsoft.com/en-us/entra/identity/domain-services/join-rhel-linux-vm)  
- **Conditional Access for Bastion** — MFA and access control policies.  
  (Bastion supports Entra Conditional Access for secure login flows) [7](https://learn.microsoft.com/en-us/azure/bastion/bastion-entra-id-authentication)

---

## 🏗️ Architecture Diagram

Engineer
↓ (Microsoft Entra ID Authentication)
Azure Bastion (no public IPs)
↓
Linux VMs (RHEL/Ubuntu)
↓
Optional:
• JumpHost (XRDP / SSH)
• Entra Domain Services (LDAP/SSSD)
• Conditional Access Policies
## 📦 Terraform Modules Structure
/modules
/network       → VNet, subnets, AzureBastionSubnet
/bastion       → Bastion host + Public IP
/vm            → Linux VMs (RHEL/Ubuntu) + Managed Identity
/aad-login     → AADSSHLoginForLinux extension + RBAC
/jumpbox       → (Optional) XRDP GUI access VM
/aads          → (Optional) Entra Domain Services integration
/policy        → (Optional) Conditional Access & Security Policies
---

## 🧰 Prerequisites

- Azure Subscription
- Azure CLI with SSH extension  
- Terraform v1.x  
- Entra ID tenant  
- Required RBAC permissions  
- For Conditional Access integration, Bastion SKU requirements must be met.  
  (Minimum SKU requirements for AAD Bastion login) [7](https://learn.microsoft.com/en-us/azure/bastion/bastion-entra-id-authentication)

---

## ⚡ Quickstart

### 1. Clone the repository
```bash
git clone https://github.com/<your-username>/Project-azure-secure-linux-access-infra.git
cd Project-azure-secure-linux-access-infra
2. Initialize Terraform
terraform init
3. Validate configuration
terraform validate
4. Deploy
terraform apply
🔐 Access After Deployment
Login securely using:

Azure Bastion (Portal or CLI)
Authentication Type: Microsoft Entra ID (certificate-based SSH)
(Supported by AADSSHLoginForLinux extension) [learn.microsoft.com]

Access permissions depend on RBAC roles:

Virtual Machine User Login
Virtual Machine Administrator Login
(Role details in Azure RBAC built-in roles list) [learn.microsoft.com]


📘 Optional Features
✔ XRDP GUI JumpHost
Install GNOME/XFCE + XRDP using Azure Linux guidance for RDP.
 [learn.microsoft.com]
✔ LDAP/SSSD Integration
Join Linux VM to Microsoft Entra Domain Services using SSSD.
 [learn.microsoft.com]
✔ Managed Identities Usage
Access Key Vault/Storage securely using system‑assigned managed identity.
 [learn.microsoft.com]

📄 License
MIT License recommended for open-source Infra-as-Code projects.
