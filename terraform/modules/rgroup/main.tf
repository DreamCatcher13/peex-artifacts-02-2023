resource "azurerm_resource_group" "myrg" {
    name     = var.rgname
    location = var.location

    tags = {
      "purpose" = "ansible-test"
  }
}