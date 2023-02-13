terraform {
  backend "azurerm" {
    resource_group_name  = "GROUP"
    storage_account_name = "mystorage"
    container_name       = "ansibletf"
    key                  = "terraform.tfstate"
  }
}
