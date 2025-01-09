# Service Plan for Azure Function
resource "azurerm_service_plan" "service_plan" {
  name                = "${var.resource_group_name}-app-service-plan"
  resource_group_name = "${var.resource_group_name}-etl-function-app"
  location            = var.resource_group_location
  os_type             = "Linux"
  sku_name            = "EP2"
  tags                = var.tags
}

# Funtion App Linux based
resource "azurerm_linux_function_app" "function_app" {

  for_each = var.function_type
  name                = "${var.resource_group_name}-${each.key}-container-function"
  resource_group_name = "${var.resource_group_name}-etl-function-app"
  location            = var.resource_group_location

  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.primary_access_key
  service_plan_id            = azurerm_service_plan.service_plan.id

  app_settings                                   = {
    "DOCKER_ENABLE_CI"                    = "true"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }
  builtin_logging_enabled                        = false
  client_certificate_mode                        = "Required"
  ftp_publish_basic_authentication_enabled       = false
  https_only                                     = true

  site_config {
    application_stack {
      docker {
        registry_url = azurerm_container_registry.acr.login_server
        image_name = each.key
        image_tag = "latest"
      }
    }
  }

  tags = each.value.tags

  lifecycle {
    # ignore_changes = [ tags["hidden-link: /app-insights-conn-string", "hidden-link: /app-insights-instrumentation-key"]]
  }
  
}

# Azure Container Registry
resource "azurerm_container_registry" "acr" {
  name                = "${var.env}containerregistry"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = "Basic"
  admin_enabled       = false
}