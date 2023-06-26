variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
}

variable "lb_name"{
  type = string
  description = "name of load balancer"
}

variable "backend_pool_name" {
  type        = string
  description = "backendpool name"
}
