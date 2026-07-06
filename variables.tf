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
  validation {
    condition = alltrue([
      for k, v in var.network_security_groups : (
        v.security_rule == null || (v.security_rule.description == null || (length(v.security_rule.description) >= 0 && length(v.security_rule.description) <= 140))
      )
    ])
    error_message = "must be between 0 and 140 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_security_groups : (
        v.security_rule == null || (v.security_rule.priority >= 100 && v.security_rule.priority <= 4096)
      )
    ])
    error_message = "must be between 100 and 4096"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_network_security_group's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: security_rule.protocol
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: security_rule.access
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: security_rule.direction
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

