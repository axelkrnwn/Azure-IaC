resource "azurerm_resource_group" "resource" {
  location = "southeastasia"
  name = var.azurerg_name
}

module "acr" {
  source        = "./modules/acr"
  resource_group_name = azurerm_resource_group.resource.name
}

module "vnet" {
  source = "./modules/vnet"
  location = azurerm_resource_group.resource.location
  resource_group_name = azurerm_resource_group.resource.name
}

module "aks" {
  source = "./modules/aks"
  location = azurerm_resource_group.resource.location
  resource_group_name = azurerm_resource_group.resource.name
  azure_subnet_id = module.vnet.vnet_subnet_id
}