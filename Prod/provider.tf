terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.35.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
    features {}
    subscription_id = "32bd2260-8449-4526-af4d-a40b9179ba7c"
}