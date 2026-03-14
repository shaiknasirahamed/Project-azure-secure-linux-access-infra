output "bastion_host_name" {
  value = azurerm_bastion_host.bastion.name
}

output "bastion_public_ip" {
  value = azurerm_public_ip.bastion_ip.ip_address
}
