variable "network_security_groups" {
  description = <<EOT
Map of network_security_groups, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - tags
    - security_rule (block):
        - access (required)
        - description (optional)
        - destination_address_prefix (optional)
        - destination_address_prefixes (optional)
        - destination_application_security_group_ids (optional)
        - destination_port_range (optional)
        - destination_port_ranges (optional)
        - direction (required)
        - name (required)
        - priority (required)
        - protocol (required)
        - source_address_prefix (optional)
        - source_address_prefixes (optional)
        - source_application_security_group_ids (optional)
        - source_port_range (optional)
        - source_port_ranges (optional)
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
    security_rule = optional(object({
      access                                     = string
      description                                = optional(string)
      destination_address_prefix                 = optional(string)
      destination_address_prefixes               = optional(set(string))
      destination_application_security_group_ids = optional(set(string))
      destination_port_range                     = optional(string)
      destination_port_ranges                    = optional(set(string))
      direction                                  = string
      name                                       = string
      priority                                   = number
      protocol                                   = string
      source_address_prefix                      = optional(string)
      source_address_prefixes                    = optional(set(string))
      source_application_security_group_ids      = optional(set(string))
      source_port_range                          = optional(string)
      source_port_ranges                         = optional(set(string))
    }))
  }))
}

