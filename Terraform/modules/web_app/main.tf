resource "azurerm_service_plan" "service_plan" {
  name                = "${var.resource_group_name}-service-plan1"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  os_type             = "Linux"
  sku_name            = "P0v3"
}

resource "azurerm_linux_web_app" "web_app" {
  name                = "${var.resource_group_name}-web-app"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  
  service_plan_id     = var.service_plan_id
  virtual_network_subnet_id = var.web_app_virtual_network_subnet_id
  
  tags                = {
    "Creator"                                        = "Terraform"
    "Environment"                                    = "Production"    
  }

  site_config {
    app_command_line                              = "npm run start"
    application_stack{
      node_version = "18-lts"
    }
    ftps_state                                    = "FtpsOnly"
    health_check_path                             = "/healthcheck"
  }
  app_settings = {
   "APPINSIGHTS_INSTRUMENTATIONKEY"                  = "8933c581-5a48-4c82-a094-320b319b0844"
   "APPINSIGHTS_PROFILERFEATURE_VERSION"             = "1.0.0"
   "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"             = "1.0.0"
   "APPLICATIONINSIGHTS_CONNECTION_STRING"           = "InstrumentationKey=8933c581-5a48-4c82-a094-320b319b0844;IngestionEndpoint=https://centralus-2.in.applicationinsights.azure.com/;LiveEndpoint=https://centralus.livediagnostics.monitor.azure.com/;ApplicationId=818cfbd3-0ae6-46f8-bccf-2f2270e15b88"
   "ApplicationInsightsAgent_EXTENSION_VERSION"      = "~3"
   "DiagnosticServices_EXTENSION_VERSION"            = "~3"
   "InstrumentationEngine_EXTENSION_VERSION"         = "disabled"
   "SnapshotDebugger_EXTENSION_VERSION"              = "disabled"
   "XDT_MicrosoftApplicationInsights_BaseExtensions" = "disabled"
   "XDT_MicrosoftApplicationInsights_Mode"           = "recommended"
   "XDT_MicrosoftApplicationInsights_PreemptSdk"     = "disabled"
   "AZURE_CLIENT_ID"                                 = ""
   "AZURE_CLIENT_SECRET"                             = ""
   "AZURE_TENANT_ID"                                 = ""
   "AZURE_keyVaultName"                              = "prod-keyvault"
   "AZURE_secretName"                                = "prod-dbdetails"
   "ApplicationInsightsAgent_EXTENSION_VERSION"      = "~3"
   "BASE_URI"                                        = "https://prod-apim.azure-api.net"
   "BLOB_CONNECTION_SECRET_NAME"                     = "prod-blob-details"
   "CANADA_LIFE"                                     = "451260003"
   "DB_SCHEMA_NAME"                                  = "prod_schema"
   "DiagnosticServices_EXTENSION_VERSION"            = "~3"
   "InstrumentationEngine_EXTENSION_VERSION"         = "disabled"
   "NODE_ENV"                                        = "prod"
   "PORT"                                            = "3000"
   "PORTAL_BASE_URI"                                 = "https://proud-coast-02b3cbf10.5.azurestaticapps.net"     
   "RULE_ENGINE_TRIGGER_URL"                         = "https://prod-rule-eng-func.azurewebsites.net/api/httpTriggerRuleEngine"
   "SCOPE"                                           = "openid profile email user.read offline_access"
   "SERVICE_BUS_KEY_VAULT_SECRET_NAME"               = "staging-servicebus"
   "SUN_LIFE"                                        = "451260000"
   "SnapshotDebugger_EXTENSION_VERSION"              = "disabled"
   "USER_INFO_URI"                                   = "https://graph.microsoft.com/v1.0/me"
   "WEBSITE_ENABLE_SYNC_UPDATE_SITE"                 = "true"
  }
  sticky_settings {
    app_setting_names = [
      "APPINSIGHTS_INSTRUMENTATIONKEY",
      "APPINSIGHTS_PROFILERFEATURE_VERSION",
      "APPINSIGHTS_SNAPSHOTFEATURE_VERSION",
      "ApplicationInsightsAgent_EXTENSION_VERSION",
      "DiagnosticServices_EXTENSION_VERSION",
      "InstrumentationEngine_EXTENSION_VERSION",
      "SnapshotDebugger_EXTENSION_VERSION",
      "XDT_MicrosoftApplicationInsights_BaseExtensions",
      "XDT_MicrosoftApplicationInsights_Mode",
      "XDT_MicrosoftApplicationInsights_PreemptSdk",
      "APPLICATIONINSIGHTS_CONNECTION_STRING ",
      "APPLICATIONINSIGHTS_CONFIGURATION_CONTENT",
      "XDT_MicrosoftApplicationInsightsJava",
      "XDT_MicrosoftApplicationInsights_NodeJS",
      ]
    # connection_string_names = []
  }
}