output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_app_id" {
  value = module.network.subnet_app_id
}

output "subnet_bastion_id" {
  value = module.network.subnet_bastion_id
}
