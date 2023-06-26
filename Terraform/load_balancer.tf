module "load_balancer" {
  source       = "../modules/load-balancer"
  rg_name = module.resource_group.name
  location = module.resource_group.location
  lb_name      = var.lb_name
  backend_pool_name = var.backend_pool_name
}
