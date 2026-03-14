# VNet
resource "azurerm_virtual_network" "this" {
  name                = "${var.project_name}-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space
  tags                = var.tags
}

# App Subnet (for Linux VMs)
resource "azurerm_subnet" "app" {
  name                 = "${var.project_name}-snet-app"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.subnet_app_cidr]
}

# Bastion Subnet (must be named AzureBastionSubnet)
resource "azurerm_subnet" "bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.subnet_bastion_cidr]
}

# Optional NSG examples (kept minimal now; Bastion manages access)
# You can attach NSGs to subnets later if needed
