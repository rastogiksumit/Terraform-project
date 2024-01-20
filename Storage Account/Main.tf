resource "azurerm_storage_account" "example" {
  name                     = "sumitstorage24"
  resource_group_name      = "SumitRG"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "example" {
  name                  = "sumitstoragecont"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}