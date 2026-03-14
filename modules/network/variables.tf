variable "project_name" {
  type        = string
  description = "Short name/prefix for resources"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Existing RG name"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "VNet CIDR blocks"
}

variable "subnet_app_cidr" {
  type        = string
  description = "App subnet CIDR"
}

variable "subnet_bastion_cidr" {
  type        = string
  description = "Bastion subnet CIDR (/26 or larger)"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply"
  default     = {}
}
