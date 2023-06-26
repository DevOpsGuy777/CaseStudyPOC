data "azurerm_client_config" "current" {}

#---------------------------
# VNET
#---------------------------
resource "azurerm_virtual_network" "vnet" {
  name                = var.hub_vnet_name
  address_space       = var.vnet_address_space 
  location            = var.location
  resource_group_name = var.rg_name
  dns_servers         = var.dns_servers
  tags     = var.tags
}

resource "azurerm_subnet" "mysubnet" {
  for_each             = var.subnets
  name                 = each.value.name
  address_prefixes     = each.value.address_prefixes
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.rg_name
  depends_on           = [azurerm_virtual_network.vnet]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "my-nsg"
  location            = var.location
  resource_group_name = var.rg_name
}

# Create an inbound security rule to allow TCP port 80
resource "azurerm_network_security_rule" "inbound_rule" {
  name                        = "allow-http"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefixes     = ["0.0.0.0/0"]
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}
