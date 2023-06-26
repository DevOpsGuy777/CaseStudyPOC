data "azurerm_subscription" "current" {}

# ------------------------
# Resource group creation
# -----------------------

resource "azurerm_resource_group" "syn_rg" {
  name = var.rg_name
  location = var.location
  tags     = var.tags
}


