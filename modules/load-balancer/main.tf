
data "azurerm_client_config" "current" {}

resource "azurerm_public_ip" "pip" {
  name                = "publicip1"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku = "Basic"
}

resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}

resource "azurerm_lb_backend_address_pool" "address_pool" {
  name                = var.backend_pool_name
  loadbalancer_id     = azurerm_lb.lb.id
}

resource "azurerm_lb_rule" "lb_rule" {
  name                  = "HTTPRule"
  loadbalancer_id       = azurerm_lb.lb.id
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.address_pool.id]
  protocol                      = "Tcp"
  frontend_port                 = 80
  backend_port                  = 8080
}
