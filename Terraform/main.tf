module "apim" {
  source                  = "./modules/api_management"
  resource_group_name     = azurerm_resource_group.resource_group.name
  resource_group_location = azurerm_resource_group.resource_group.location
  tags                    = var.tags
}

module "data_factory" {
  source                     = "./modules/data_factory"
  resource_group_name        = azurerm_resource_group.resource_group.name
  resource_group_location    = azurerm_resource_group.resource_group.location
  connection_string          = module.storage_account.primary_connection_string
  postgres_connection_string = module.postgresql_server.postgres_connection_string
  tags                       = var.tags
}

module "function_app" {
  source                  = "./modules/function_app"
  for_each                = var.function_type
  function_type           = each.value
  env                     = var.env
  resource_group_name     = azurerm_resource_group.resource_group.name
  resource_group_location = azurerm_resource_group.resource_group.location
  storage_account_name    = module.storage_account.storage_account_name
  primary_access_key      = module.storage_account.primary_access_key
  depends_on              = [module.storage_account]
  tags                    = var.tags
}

module "key_vault" {
  source                  = "./modules/key_vault"
  resource_group_name     = azurerm_resource_group.resource_group.name
  resource_group_location = azurerm_resource_group.resource_group.location
  # virtual_network_subnet_ids = module.postgresql_server.virtual_network_subnet_ids
  dbPassword              = var.administrator_password
  tags                    = var.tags
}

module "postgresql_server" {
  source                  = "./modules/postgresql_server"
  resource_group_name     = azurerm_resource_group.resource_group.name
  resource_group_location = azurerm_resource_group.resource_group.location
  administrator_login     = var.administrator_login
  administrator_password  = var.administrator_password
  tags                    = var.tags
  virtual_network_id      = module.virtual_network.virtual_network_id
  delegated_subnet_id     = module.virtual_network.delegated_subnet_id
  # adf_subnet_id           = module.virtual_network.adf_subnet_id
  depends_on              = [module.virtual_network]
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = var.tags
}

module "static_web_app" {
  source                  = "./modules/static_web_app"
  resource_group_name     = azurerm_resource_group.resource_group.name
  resource_group_location = azurerm_resource_group.resource_group.location
  tags                    = var.tags
  depends_on              = [module.storage_account]
}

module "storage_account" {
  source                  = "./modules/storage_account"
  resource_group_name     = azurerm_resource_group.resource_group.name
  resource_group_location = azurerm_resource_group.resource_group.location
  env                     = var.env
  tags                    = var.tags
}

module "virtual_network" {
  source                  = "./modules/virtual_network"
  resource_group_name     = azurerm_resource_group.resource_group.name
  resource_group_location = azurerm_resource_group.resource_group.location
  tags                    = var.tags

}

module "web_app" {
  source                            = "./modules/web_app"
  resource_group_name               = azurerm_resource_group.resource_group.name
  resource_group_location           = azurerm_resource_group.resource_group.location
  service_plan_id                   = module.web_app.service_plan_id
  web_app_virtual_network_subnet_id = module.virtual_network.web_app_virtual_network_subnet_id
  tags                              = var.tags
}