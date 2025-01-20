resource "azurerm_static_web_app" "static_web_app" {
  name     = "${var.resource_group_name}-static-web-app"
  sku_tier = "Free"
  tags     = var.tags

  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
}
