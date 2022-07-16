# 1. Specify the version of the AzureRM Provider to use
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.1"
    }
  }
}

# 2. Configure the AzureRM Provider
provider "azurerm" {
 skip_provider_registration = true
 subscription_id = "195189f7-38db-48e9-8e79-a72596572df2"
  features {}
}  
