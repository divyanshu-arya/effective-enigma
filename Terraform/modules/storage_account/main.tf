# Storage account Block
resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.env}storageaccount"
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

# Container in Storage Account
resource "azurerm_storage_container" "_storage_account_container" {
  name                  = "data-ingestion"
  storage_account_name  = azurerm_storage_account._storage_account.name
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.storage_account]
}
