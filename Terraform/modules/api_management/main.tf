resource "azurerm_api_management" "apim" {
  name                = "${var.resource_group_name}-apim"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  publisher_name      = "My Company"
  publisher_email     = "company@terraform.io"

  sku_name = "Consumption_0"
  tags     = var.tags
}

resource "azurerm_api_management_api" "api" {
  name                = "${var.resource_group_name}-web-app"
  resource_group_name = var.resource_group_name
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "${var.resource_group_name}-web-app"
  protocols           = ["https"]
  subscription_required = false

}

/* resource "azurerm_api_management_api_policy" "api-policy" {
  api_name            = azurerm_api_management_api.api.name
  api_management_name = azurerm_api_management.apim.name
  resource_group_name = var.resource_group_name

  xml_content = <<XML
  <policies>
      <inbound>
          <base />
          <cors>
              <allowed-origins>
                  <origin>*</origin>
              </allowed-origins>
              <allowed-methods preflight-result-max-age="300">
                  <method>GET</method>
                  <method>POST</method>
                  <method>PUT</method>
                  <method>DELETE</method>
                  <method>OPTIONS</method>
              </allowed-methods>
              <allowed-headers>
                  <header>*</header>
              </allowed-headers>
              <expose-headers>
                  <header>Content-Length</header>
                  <header>Content-Type</header>
              </expose-headers>
          </cors>
      </inbound>
      <backend>
          <base />
      </backend>
      <outbound>
          <base />
      </outbound>
      <on-error>
          <base />
      </on-error>
  </policies>
XML
}
*/