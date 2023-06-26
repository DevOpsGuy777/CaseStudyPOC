output "name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_id" {
  value = { for subnet_key, subnet in azurerm_subnet.mysubnet : subnet_key => subnet.id }
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}



