module "virtual_network" {
  source       = "../modules/virtual-network"
  rg_name = module.resource_group.name
  location = module.resource_group.location
  hub_vnet_name = var.hub_vnet_name
  vnet_address_space = var.vnet_address_space
  dns_servers = var.dns_servers
  subnets = var.subnets
  tags     = local.common_tags  
}