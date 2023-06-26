output "lb_name" {
  value = azurerm_lb.lb.name
}

output "backend_pool_name" {
  value = azurerm_lb_backend_address_pool.address_pool.name
}

output "backend_pool_id" {
  value = [azurerm_lb_backend_address_pool.address_pool.id]
}


