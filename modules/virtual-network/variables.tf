variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
}


variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = any
}

variable "dns_servers" {
  description = "List of DNS servers to use for the virtual network"
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "Subnet address prefixes for the virtual network"
  type        = any 
}

variable "hub_vnet_name" {
  description = "Subnet name"
  type        = string 
}