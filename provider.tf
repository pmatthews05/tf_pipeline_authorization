terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
    }
  }
}

provider "azurerm" {
    features {}
}

provider "azuredevops" {

}