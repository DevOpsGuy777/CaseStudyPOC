variable "location" {
  type = string
}
variable "rg_name" {
  type = string
}

variable "hub_vnet_name" {
  description = "Subnet name"
  type        = string 
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

variable "subnets" {        
  description = "subnet address prefixes to respective environments"
  type = any  
}

variable "vnet_address_space" {       
  description = "Address space to respective environments"
  type = any
}

variable "dns_servers" {
  description = "List of dns servers to use for virtual network"
  default     = []
}

variable "user_password" {
  description = "user password"
  type        = string
}

variable "lb_name"{
  type = string
  description = "name of load balancer"
}

variable "backend_pool_name" {
  type        = string
  description = "backendpool name"
}

variable "user_display_name" {
  description = "Display name of the IAM user"
  type        = string
}

variable "user_principal_name" {
  description = "User Principal Name (UPN) of the IAM user"
  type        = string  
}

variable "role_name" {
  description = "Name of the custom role"
  type        = string
}

variable "role_description" {
  description = "Description of the custom role"
  type        = string
}

# variable "scope" {
#   description = "Scope at which the role is assignable"
#   type        = string
# }


variable "env" {
  type = string
}

variable "client_code"{
  type = string
}

variable "charge_code"{
  type = string
}

variable "CLIENT_SUBSCRIPTION_ID" {
  type = string
}

variable  "ARM_TENANT_ID" {
  type = string
}

variable  "ARM_CLIENT_ID" {
  type = string
}

variable  "ARM_CLIENT_SECRET" {     
  type = string
}


variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
