output "virtual_network_id" {
  value = azurerm_virtual_network.vnet.id
}

output "delegated_subnet_id" {
  value = azurerm_subnet.postgres-subnet.id
}

# output "adf_subnet_id" {
#   value = azurerm_subnet.adf-subnet.id
# }

output "web_app_virtual_network_subnet_id" {
  value = azurerm_subnet.web-app-subnet.id
}