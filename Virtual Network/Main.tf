resource "azurerm_virtual_network" "example" {
  name                = "sumit_Vnet"
  location            ="West europe"
  resource_group_name = "SumitRG"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "Sumitsubnet1"
    address_prefix = "10.0.1.0/24"
  }
}
