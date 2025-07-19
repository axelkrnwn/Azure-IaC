resource "azurerm_kubernetes_cluster" "resource" {
  name                = "xk-aks1"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "xk-aks1"
  

  default_node_pool {
    name                 = "default"
    node_count           = 1
    vm_size              = "Standard_B2ps_v2"
    type                 = "VirtualMachineScaleSets"
    vnet_subnet_id       = var.azure_subnet_id
    zones = ["1","2","3"]
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
   network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
    service_cidr      = "10.22.40.0/24"
    dns_service_ip    = "10.22.40.10"
  }
  kubernetes_version = "1.31.6"
}

