output "primary_connection_string" {
  value = azurerm_storage_account.storage_account.primary_connection_string
}

output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}

output "primary_access_key" {
  value = azurerm_storage_account.storage_account.primary_access_key
}