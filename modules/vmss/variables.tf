variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
}

variable "vmss_name"{
  type = string
  description = "Name of VMSS"
}

variable "vmss_sku"{
  type = string
  description = "SKU for vmss"
}

variable "vmss_password"{
  type = string
  description = "Password of VMSS"
}

variable "instance_count"{
  type = string
  description = "intance count for vmss"
}

variable "subnet_id" {
  type        = map
  description = "subnet mapping value"
}

variable "lb_address_pool_id" {
  description = "IDs of the load balancer backend address pools"
  type        = set(string)
  default     = []
}


variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "nsg_id" {
  type        = string
  description = "nsg id"
}



