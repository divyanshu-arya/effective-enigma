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
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = "7249e5ff-99c0-4d48-935f-ebf7a8f9603d"
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
    ]
  } 
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = "c783df84-b085-49fa-97e7-ee29383306cd"
    secret_permissions = [
      "Get",
      "List",
    ]
  } 
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = "25fd0ae8-609f-420b-b81e-44ca73478767"
    secret_permissions = [
      "Get",
      "List",
    ]
  } 
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = "ae6db386-6433-4451-a6d3-cfefda7961ef"
    secret_permissions = [
      "Get",
      "List",
    ]
  } 
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = "c93d5f27-cb6f-4621-81cc-3caa4514c697"
    secret_permissions = [
      "Get",
      "List",
    ]
  } 
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = "da35b7fd-8768-4294-b945-bceef31a6a6b"
    secret_permissions = [
      "Get",
      "List",
    ]
  } 
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = "353947be-5109-4430-9310-b4ba5aa55560"
    secret_permissions = [
      "List",
      "Get",
    ]
  } 
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = "afd13b14-fbf7-4ba2-a1ab-deb10b8a7f17"
    secret_permissions = [
      "Get",
      "List",
    ]
  } 
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = "88a915fd-93d4-49c7-9c9d-d1c5401ad029"
    secret_permissions = [
      "Get",
      "List",
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
