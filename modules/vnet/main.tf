
resource "azurerm_virtual_network" "vnet" {
  name                = "aks-vnet"
  address_space       = ["10.22.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "default" {
    name = "default-sn"
    address_prefixes = ["10.22.10.0/24"]
    virtual_network_name = azurerm_virtual_network.vnet.name
    resource_group_name = var.resource_group_name
}
resource "azurerm_subnet" "aks" {
    name = "aks-sn"
    address_prefixes = ["10.22.20.0/24"]
    virtual_network_name = azurerm_virtual_network.vnet.name
    resource_group_name = var.resource_group_name
}