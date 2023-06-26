terraform {
  backend "azurerm" {} #commnent out for local run; uncomment for CircleCI
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.59.0"
    }
  }
}

# OR-14490 -- resource group prevent deletio flag set to false to prevent fairlue of destroy nested resources in somecases 
provider "azurerm" {
  subscription_id = var.CLIENT_SUBSCRIPTION_ID
  tenant_id       = var.ARM_TENANT_ID
  client_id       = var.ARM_CLIENT_ID
  client_secret   = var.ARM_CLIENT_SECRET
  features {
    resource_group {
    prevent_deletion_if_contains_resources = false
    }
  }
}

provider "azurerm" {
  alias           = "hub"
  subscription_id = var.hub_subscription_id
  tenant_id       = var.hub_tenant_id
  client_id       = var.hub_arm_client_id
  client_secret   = var.hub_arm_client_secret
  features {}
}

data "azurerm_client_config" "current" {}

data "http" "ip" {
  url = "https://ifconfig.me"
}


locals {
  product_id        = 12345
  common_tags = merge(var.tags,
    { "product_id" = local.product_id },
    { "environment" = var.env },
    { "client_code" = var.client_code },
    { "used_for" = (var.env == "prod") ? "prod" : "non_prod" })
}
