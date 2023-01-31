resource "azurerm_linux_virtual_machine" "myvm" {
    count                           = 2
    name                            = var.vm_names[count.index]
    resource_group_name             = var.grp
    location                        = var.location
    admin_username                  = var.user 
    admin_password                  = var.pass 
    disable_password_authentication = false
    size                            = "Standard_B2s"
    network_interface_ids           = [var.nic_ids[count.index]]

    source_image_reference {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }

    os_disk {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    tags = {
      "application" = var.tags[count.index]
    }
}