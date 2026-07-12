output "network_security_groups_id" {
  description = "Map of id values across all network_security_groups, keyed the same as var.network_security_groups"
  value       = { for k, v in azurerm_network_security_group.network_security_groups : k => v.id }
}
output "network_security_groups_location" {
  description = "Map of location values across all network_security_groups, keyed the same as var.network_security_groups"
  value       = { for k, v in azurerm_network_security_group.network_security_groups : k => v.location }
}
output "network_security_groups_name" {
  description = "Map of name values across all network_security_groups, keyed the same as var.network_security_groups"
  value       = { for k, v in azurerm_network_security_group.network_security_groups : k => v.name }
}
output "network_security_groups_resource_group_name" {
  description = "Map of resource_group_name values across all network_security_groups, keyed the same as var.network_security_groups"
  value       = { for k, v in azurerm_network_security_group.network_security_groups : k => v.resource_group_name }
}
output "network_security_groups_security_rule" {
  description = "Map of security_rule values across all network_security_groups, keyed the same as var.network_security_groups"
  value       = { for k, v in azurerm_network_security_group.network_security_groups : k => v.security_rule }
}
output "network_security_groups_tags" {
  description = "Map of tags values across all network_security_groups, keyed the same as var.network_security_groups"
  value       = { for k, v in azurerm_network_security_group.network_security_groups : k => v.tags }
}

