data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key-vault" {
  name                        = "${var.resource_group_name}-keyvault"
  location                    = var.resource_group_location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  # soft_delete_retention_days  = 7
  purge_protection_enabled = false

  sku_name = "standard"
  tags     = var.tags

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "List",
      "Delete",
      "Purge",
      "Recover",
    ]

    storage_permissions = [
      "Get",
    ]
  }
  
  # network_acls {
  #   bypass = "AzureService"
  #   default_action = "Deny"
  # virtual_network_subnet_ids = "${var.virtual_network_subnet_ids}"
  # }
}

resource "azurerm_key_vault_secret" "dbSecret-pwd" {
  name         = "dbPassword"
  value        = var.dbPassword
  key_vault_id = azurerm_key_vault.key-vault.id
}
