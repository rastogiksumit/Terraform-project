resource "azurerm_resource_group" "example" {
  for_each = var.resource
  name     = each.value.name
  location = "West Europe"
}
