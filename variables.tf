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
        - access (optional)
        - description (optional)
        - destination_address_prefix (optional)
        - destination_address_prefixes (optional)
        - destination_application_security_group_ids (optional)
        - destination_port_range (optional)
        - destination_port_ranges (optional)
        - direction (optional)
        - name (optional)
        - priority (optional)
        - protocol (optional)
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
    security_rule = optional(list(object({
      access                                     = optional(string)
      description                                = optional(string)
      destination_address_prefix                 = optional(string)
      destination_address_prefixes               = optional(set(string))
      destination_application_security_group_ids = optional(set(string))
      destination_port_range                     = optional(string)
      destination_port_ranges                    = optional(set(string))
      direction                                  = optional(string)
      name                                       = optional(string)
      priority                                   = optional(number)
      protocol                                   = optional(string)
      source_address_prefix                      = optional(string)
      source_address_prefixes                    = optional(set(string))
      source_application_security_group_ids      = optional(set(string))
      source_port_range                          = optional(string)
      source_port_ranges                         = optional(set(string))
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.network_security_groups : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_security_groups : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_security_groups : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_security_groups : (
        v.security_rule == null || alltrue([for item in v.security_rule : (item.description == null || (length(item.description) >= 0 && length(item.description) <= 140))])
      )
    ])
    error_message = "must be between 0 and 140 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_security_groups : (
        v.security_rule == null || alltrue([for item in v.security_rule : (item.priority == null || (item.priority >= 100 && item.priority <= 4096))])
      )
    ])
    error_message = "must be between 100 and 4096"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_security_groups : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 8 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

