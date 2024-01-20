resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = "SumitRG"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/13b0a9c7-487b-479c-8f3e-64a0a1baa476/resourceGroups/SumitRG/providers/Microsoft.Network/virtualNetworks/sumit_Vnet/subnets/Sumitsubnet1"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "example" {
  name                = "Sumitmachine"
  resource_group_name = "SumitRG"
  location            = "West europe"
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
