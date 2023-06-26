
data "azurerm_client_config" "current" {}

resource "azurerm_linux_virtual_machine_scale_set" "ws" {
  name                = var.vmss_name
  location            = var.location
  resource_group_name = var.rg_name
  sku = var.vmss_sku
  instances            = var.instance_count
  admin_username       = "adminuser"
  admin_password = var.vmss_password
  disable_password_authentication = false

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "example"
    primary = true
    network_security_group_id   = var.nsg_id


    ip_configuration {
      name                          = "internal"
      subnet_id = var.subnet_id["app_snet"]
      primary                       = true
      load_balancer_backend_address_pool_ids = var.lb_address_pool_id
    }
  }
  tags = var.tags
}


