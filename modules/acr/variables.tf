variable "azurecr_name" {
    type = string
    description = "Azure Container Registry (ACR)"
    default = "XKContainerRegistry"
}

variable "resource_group_name" {
    type = string
}

variable "location" {
    default = "southeastasia"
    type = string
}
