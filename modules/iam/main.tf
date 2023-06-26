data "azurerm_client_config" "current" {}

resource "azuread_user" "iam_user" {
  display_name         = var.user_display_name
  user_principal_name  = var.user_principal_name
  password = var.user_password
}

resource "azurerm_role_definition" "restart_webserver_role" {
  name        = var.role_name
  description = var.role_description
  scope = var.scope

  permissions {
    actions = [
      "Microsoft.Compute/virtualMachines/restart/action"
    ]
  }
}

resource "azurerm_role_assignment" "iam_user_role" {
  scope                = var.scope
  role_definition_name = azurerm_role_definition.restart_webserver_role.name
  principal_id         = azuread_user.iam_user.object_id
}
