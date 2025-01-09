# Data Factory Block
resource "azurerm_data_factory" "data_factory" {
  name                = "${var.resource_group_name}-data-factory"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  managed_virtual_network_enabled = true
  tags                = var.tags
  identity {
    # identity_ids = []
    type         = "SystemAssigned"
  }
}
/*
# Linked Service for blob storage
resource "azurerm_data_factory_linked_service_azure_blob_storage" "blob_linked_service" {
  name              = "${var.resource_group_name}-blob-linked-service"
  data_factory_id   = azurerm_data_factory.data_factory.id
  connection_string = var.connection_string
}

# Dataset block for blob
resource "azurerm_data_factory_dataset_azure_blob" "blob_dataset" {
  name                = "${var.resource_group_name}-blob-dataset"
  data_factory_id     = azurerm_data_factory.data_factory.id
  linked_service_name = azurerm_data_factory_linked_service_azure_blob_storage.blob_linked_service.name

  path = "/data-ingestion"
  #   filename = "bar.png"
}

# Linked Service for Postgresql Server
resource "azurerm_data_factory_linked_service_postgresql" "postgresql_server_linked_server" {
  name              = "${var.resource_group_name}-postgresql-linked-service"
  data_factory_id   = azurerm_data_factory.data_factory.id
  connection_string = var.postgres_connection_string
  # connection_string = module.postgresql_server.postgres_connection_string
}

# Dataset block for postgresql
resource "azurerm_data_factory_dataset_postgresql" "postgresql_dataset" {
  name                = "${var.resource_group_name}-postgresql-dataset"
  data_factory_id     = azurerm_data_factory.data_factory.id
  linked_service_name = azurerm_data_factory_linked_service_postgresql.postgresql_server_linked_server.name
}
*/