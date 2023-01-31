terraform {
  backend "azurerm" {
    resource_group_name  = "tf-state"
    storage_account_name = "mystorageforterraform"
    container_name       = "ansible-tf"
    key                  = "terraform.tfstate"
  }
}