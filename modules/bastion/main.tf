# Public IP for Bastion
resource "azurerm_public_ip" "bastion_ip" {
  name                = "${var.project_name}-bastion-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

# Azure Bastion Host
resource "azurerm_bastion_host" "bastion" {
  name                = "${var.project_name}-bastion"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = "bastion-ip-config"
    subnet_id            = var.subnet_bastion_id
    public_ip_address_id = azurerm_public_ip.bastion_ip.id
  }

  sku = "Standard"

  tags = var.tags
}
