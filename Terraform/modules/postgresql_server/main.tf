# Private DNS Zone for PostgreSQL
resource "azurerm_private_dns_zone" "private_dns_zone" {
  name                = "${var.resource_group_name}-private-dns.postgres.database.azure.com"
  resource_group_name = var.resource_group_name
}

# Private DNS A Record for PostgreSQL Flexible Server
# resource "azurerm_private_dns_a_record" "postgres_a_record" {
#   name                = azurerm_postgresql_flexible_server.postgresql_server.name
#   zone_name           = azurerm_private_dns_zone.private_dns_zone.name
#   resource_group_name = var.resource_group_name
#   ttl                 = 300
#   records             = [azurerm_postgresql_flexible_server.postgresql_server.fqdn]
# }

# Virtual Network Link for Private DNS Zone
# resource "azurerm_private_dns_zone_virtual_network_link" "dns_zone_vnet_link" {
#   name                  = "${var.resource_group_name}-dns-vnet-link"
#   private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.name
#   virtual_network_id    = var.virtual_network_id
#   resource_group_name   = var.resource_group_name
#   depends_on            = [var.virtual_network_id]
# }

resource "azurerm_postgresql_flexible_server" "postgresql_server" {
  name                   = "${var.resource_group_name}-postgres-server"
  resource_group_name    = var.resource_group_name
  location               = var.resource_group_location
  version                = "16"
  # delegated_subnet_id    = var.delegated_subnet_id
  # private_dns_zone_id    = azurerm_private_dns_zone.private_dns_zone.id
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  zone                   = "1"
#######################################################
  auto_grow_enabled             = true
  backup_retention_days         = 30
  storage_tier                  = "P6"
  geo_redundant_backup_enabled  = true
  authentication {
    active_directory_auth_enabled = false
    password_auth_enabled         = true
      tenant_id                     = null
  }

  high_availability {
    mode                      = "ZoneRedundant"
    standby_availability_zone = "3"
  }

#######################################################
  storage_mb = 65536

  sku_name   = "GP_Standard_D2s_v3"
  tags       = var.tags
  # depends_on = [azurerm_private_dns_zone_virtual_network_link.dns_zone_vnet_link]

}

# Private Endpoint for ADF to access PostgreSQL
# resource "azurerm_private_endpoint" "adf_to_postgresql" {
#   name                = "pe-adf-postgresql"
#   location            = var.resource_group_location
#   resource_group_name = var.resource_group_name
#   subnet_id           = var.adf_subnet_id

#   private_service_connection {
#     name                           = "psc-adf-postgresql"
#     private_connection_resource_id = azurerm_postgresql_flexible_server.postgresql_server.id
#     is_manual_connection           = false
#     subresource_names              = ["postgresqlServer"]
#   }
# }