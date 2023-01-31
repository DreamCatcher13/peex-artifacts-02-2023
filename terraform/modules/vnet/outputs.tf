output "nic_ids" {
    description = "list of NIC IDs "
    value       = azurerm_network_interface.mynic.*.id
}

output "subnet_id" {
    description = "subnet IDs "
    value       = azurerm_subnet.mysub.id
}