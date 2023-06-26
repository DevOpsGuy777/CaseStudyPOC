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

variable "scope" {
  description = "Scope at which the role is assignable"
  type        = string
}

variable "user_password" {
  description = "user password"
  type        = string
}

