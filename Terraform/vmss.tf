module "vmss" {
  source       = "../modules/vmss"
  rg_name = module.resource_group.name
  location = module.resource_group.location
  subnet_id  = module.virtual_network.subnet_id
  nsg_id = module.virtual_network.nsg_id
  vmss_name      = var.vmss_name
  vmss_password      = var.vmss_password
  vmss_sku = var.vmss_sku
  instance_count = var.instance_count
  lb_address_pool_id = module.load_balancer.backend_pool_id
  tags = local.common_tags
}

