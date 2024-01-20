terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.88.0"
    }
  }
   backend "azurerm" {
    resource_group_name  = "SumitRG"
    storage_account_name = "sumitstorage24"
    container_name       = "sumitstoragecont"
    key                  = "RG.terraform.tfstate"
  }
}

provider "azurerm" {
  # Configuration options
  features {
    
  }
}