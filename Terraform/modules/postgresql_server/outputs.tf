output "postgres_connection_string" {
  value = "Host=${azurerm_postgresql_flexible_server.postgresql_server.fqdn};Port=5432;Database=database;UID=${azurerm_postgresql_flexible_server.postgresql_server.id};EncryptionMethod=0;Password=${azurerm_postgresql_flexible_server.postgresql_server.administrator_password}"
}