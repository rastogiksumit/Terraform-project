resource "azurerm_public_ip" "example" {
  name                = "PublicIPLB"
  location            = "West Europe"
  resource_group_name = "SumitRG"
  allocation_method   = "Static"
  sku="Standard"
}

resource "azurerm_lb" "example" {
  name                = "SumitLoadBalancer"
  location            = "West Europe"
  resource_group_name = "SumitRG"
  sku = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.example.id
  }
}
resource "azurerm_lb_backend_address_pool" "example" {
  loadbalancer_id = azurerm_lb.example.id
  name            = "BackEndAddressPool"
}
resource "azurerm_lb_backend_address_pool_address" "example" {
  name                    = "Lbbackendaddress"
  backend_address_pool_id = azurerm_lb_backend_address_pool.example.id
  virtual_network_id      = data.azurerm_virtual_network.example.id
  ip_address              = "10.0.0.1"
}
resource "azurerm_lb_probe" "example" {
  loadbalancer_id = azurerm_lb.example.id
  name            = "http-running-probe"
  port            = 80
}
resource "azurerm_lb_rule" "example" {
  loadbalancer_id                = azurerm_lb.example.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddress"
}
