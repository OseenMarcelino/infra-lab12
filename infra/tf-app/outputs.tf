output "resource_group_name" {
  value       = azurerm_resource_group.app_rg.name
  description = "The name of the resource group where the resources are deployed."
}