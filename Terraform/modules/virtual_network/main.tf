resource "azurerm_virtual_network" "vnet" {
  name                = "${var.resource_group_name}-vnet"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "postgres-subnet" {
  name                 = "${var.resource_group_name}-postgres-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
  depends_on = [azurerm_virtual_network.vnet]
}

resource "azurerm_subnet" "web-app-subnet" {
  name                 = "${var.resource_group_name}-web-app-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.3.0/24"]
  delegation {
    name = "webapp_delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/action"
      ]
    }
  }

}

# resource "azurerm_subnet" "adf-subnet" {
#   name                 = "${var.resource_group_name}-adf-subnet"
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["10.0.4.0/24"]
# }