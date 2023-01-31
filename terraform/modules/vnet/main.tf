resource "azurerm_public_ip" "myip" {
    count = 2
    name                = var.ip_name[count.index]
    location            = var.location
    resource_group_name = var.grp 
    allocation_method   = "Static"
}

resource "azurerm_virtual_network" "myvnet" {
    name                = var.vnet_name
    location            = var.location
    resource_group_name = var.grp
    address_space       = ["${var.vnet_addr}"]

    tags = {
      "purpose" = "vm"
    }
}

resource "azurerm_subnet" "mysub" {
    name                 = var.subnet_name
    resource_group_name  = var.grp
    virtual_network_name = azurerm_virtual_network.myvnet.name
    address_prefixes     = ["${var.subnet_addr}"]
}

resource "azurerm_network_interface" "mynic" {
    count               = 2
    name                = var.nic_name[count.index]
    location            = var.location
    resource_group_name = var.grp

    ip_configuration {
      name                          = "internal"
      subnet_id                     = azurerm_subnet.mysub.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id          = element(azurerm_public_ip.myip.*.id, count.index)
    }
}

resource "azurerm_network_security_group" "mysecgrp" {
    name                = var.sec_name
    location            = var.location
    resource_group_name = var.grp

    tags = {
      "purpose" = "allow_ssh"
    }
}

resource "azurerm_network_security_rule" "ssh" {
    name                        = "SSH"
    priority                    = 1000
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = var.grp
    network_security_group_name = azurerm_network_security_group.mysecgrp.name
}

resource "azurerm_subnet_network_security_group_association" "connect" {
  subnet_id                 = azurerm_subnet.mysub.id
  network_security_group_id = azurerm_network_security_group.mysecgrp.id
}
