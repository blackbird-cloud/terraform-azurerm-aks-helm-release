terraform {
  required_version = ">= 1.2"
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.79.0"
    }
  }
}
