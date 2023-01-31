output "location" {
    description = "RG location"
    value = azurerm_resource_group.myrg.location
}

output "rg_name" {
    description = "RG name"
    value = azurerm_resource_group.myrg.name
}
