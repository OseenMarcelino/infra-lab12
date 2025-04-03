provider "azurerm" {
  features {}
  subscription_id = "b40c6add-0fa1-4055-9718-f3d28641e566"
}

resource "azurerm_resource_group" "rg" {
  name     = "marc0430-githubactions-rg"
  location = "Canada Central"
}

resource "azurerm_storage_account" "storage" {
  name                     = "marc0430githubactions"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "container_name" {
  value = azurerm_storage_container.tfstate.name
}

output "arm_access_key" {
  value     = azurerm_storage_account.storage.primary_access_key
  sensitive = true
}
