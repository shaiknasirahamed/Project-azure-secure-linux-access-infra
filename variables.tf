variable "project_name" {
  description = "Short name/prefix for all resources"
  type        = string
  default     = "az-secure-linux"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "vnet_address_space" {
  description = "VNet address space"
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "subnet_app_cidr" {
  description = "Application subnet CIDR"
  type        = string
  default     = "10.10.1.0/24"
}

variable "subnet_bastion_cidr" {
  description = "AzureBastionSubnet CIDR (must be /26 or larger)"
  type        = string
  default     = "10.10.100.0/26"
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    env     = "lab"
    project = "azure-secure-linux-access"
  }
}

