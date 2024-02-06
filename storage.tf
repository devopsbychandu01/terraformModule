variable "RGName" {
  type = string
}

resource "azurerm_resource_group" "prodGroup" {
  name = var.RGName
  location = "eastus"
}

resource "azurerm_storage_account" "mystorageAccount" {
  name = "devopsbychandu001"
  resource_group_name = var.RGName
  location = "eastus"
  account_tier = "Standard"
  account_replication_type = "LRS"
  depends_on = [ azurerm_resource_group.prodGroup ]
}

# resource "azurerm_storage_account" "storageAccount" {
#   name = var.storageAccountName
#   location = var.location
#   account_replication_type = var.replicationType
#   account_tier = var.AccountKind
#   resource_group_name = azurerm_resource_group.myresourceGroup.name
# }
