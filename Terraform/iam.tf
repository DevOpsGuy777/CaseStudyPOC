module "iam" {
  source              = "../modules/iam"
  user_display_name   = var.user_display_name
  user_principal_name = var.user_principal_name
  role_name           = var.role_name
  role_description    = var.role_description
  scope               = module.vmss.vmss_id
  user_password = var.user_password
}
