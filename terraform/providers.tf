terraform {
  required_providers{
 azurerm = {
  version         = "2.59.0"
  source  = "hashicorp/azurerm"
 } 
}
}

provider azurerm {
  features {}
  subscription_id = var.subscription-id
  client_id       = var.client-id
  client_secret   = var.client-secret
  tenant_id       = var.tenant-id
}