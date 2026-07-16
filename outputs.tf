output "network_security_groups_id" {
  description = "Map of id values across all network_security_groups, keyed the same as var.network_security_groups"
  value       = { for k, v in azurerm_network_security_group.network_security_groups : k => v.id if v.id != null && length(v.id) > 0 }
}
output "network_security_groups_location" {
  description = "Map of location values across all network_security_groups, keyed the same as var.network_security_groups"
  value       = { for k, v in azurerm_network_security_group.network_security_groups : k => v.location if v.location != null && length(v.location) > 0 }
}
output "network_security_groups_name" {
  description = "Map of name values across all network_security_groups, keyed the same as var.network_security_groups"
  value       = { for k, v in azurerm_network_security_group.network_security_groups : k => v.name if v.name != null && length(v.name) > 0 }
}
output "network_security_groups_resource_group_name" {
  description = "Map of resource_group_name values across all network_security_groups, keyed the same as var.network_security_groups"
  value       = { for k, v in azurerm_network_security_group.network_security_groups : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "network_security_groups_security_rule" {
  description = "Map of security_rule values across all network_security_groups, keyed the same as var.network_security_groups"
  value       = { for k, v in azurerm_network_security_group.network_security_groups : k => v.security_rule if v.security_rule != null && length(v.security_rule) > 0 }
}
output "network_security_groups_tags" {
  description = "Map of tags values across all network_security_groups, keyed the same as var.network_security_groups"
  value       = { for k, v in azurerm_network_security_group.network_security_groups : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

