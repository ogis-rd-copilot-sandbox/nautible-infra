output "subnet_ids" {
  value = azurerm_subnet.subnet.*.id
}

output "virtual_network_id" {
  value = azurerm_virtual_network.vnet.id
}
