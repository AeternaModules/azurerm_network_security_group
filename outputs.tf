output "network_security_groups" {
  description = "All network_security_group resources"
  value       = azurerm_network_security_group.network_security_groups
}
output "network_security_groups_location" {
  description = "List of location values across all network_security_groups"
  value       = [for k, v in azurerm_network_security_group.network_security_groups : v.location]
}
output "network_security_groups_name" {
  description = "List of name values across all network_security_groups"
  value       = [for k, v in azurerm_network_security_group.network_security_groups : v.name]
}
output "network_security_groups_resource_group_name" {
  description = "List of resource_group_name values across all network_security_groups"
  value       = [for k, v in azurerm_network_security_group.network_security_groups : v.resource_group_name]
}
output "network_security_groups_security_rule" {
  description = "List of security_rule values across all network_security_groups"
  value       = [for k, v in azurerm_network_security_group.network_security_groups : v.security_rule]
}
output "network_security_groups_tags" {
  description = "List of tags values across all network_security_groups"
  value       = [for k, v in azurerm_network_security_group.network_security_groups : v.tags]
}

