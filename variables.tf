variable "monitor_metric_alerts" {
  description = <<EOT
Map of monitor_metric_alerts, attributes below
Required:
    - name
    - resource_group_name
    - scopes
Optional:
    - auto_mitigate
    - description
    - enabled
    - frequency
    - severity
    - tags
    - target_resource_location
    - target_resource_type
    - window_size
    - action (block):
        - action_group_id (required)
        - webhook_properties (optional)
    - application_insights_web_test_location_availability_criteria (block):
        - component_id (required)
        - failed_location_count (required)
        - web_test_id (required)
    - criteria (block):
        - aggregation (required)
        - dimension (optional, block):
            - name (required)
            - operator (required)
            - values (required)
        - metric_name (required)
        - metric_namespace (required)
        - operator (required)
        - skip_metric_validation (optional)
        - threshold (required)
    - dynamic_criteria (block):
        - aggregation (required)
        - alert_sensitivity (required)
        - dimension (optional, block):
            - name (required)
            - operator (required)
            - values (required)
        - evaluation_failure_count (optional)
        - evaluation_total_count (optional)
        - ignore_data_before (optional)
        - metric_name (required)
        - metric_namespace (required)
        - operator (required)
        - skip_metric_validation (optional)
EOT

  type = map(object({
    name                     = string
    resource_group_name      = string
    scopes                   = set(string)
    auto_mitigate            = optional(bool) # Default: true
    description              = optional(string)
    enabled                  = optional(bool)   # Default: true
    frequency                = optional(string) # Default: "PT1M"
    severity                 = optional(number) # Default: 3
    tags                     = optional(map(string))
    target_resource_location = optional(string)
    target_resource_type     = optional(string)
    window_size              = optional(string) # Default: "PT5M"
    action = optional(list(object({
      action_group_id    = string
      webhook_properties = optional(map(string))
    })))
    application_insights_web_test_location_availability_criteria = optional(object({
      component_id          = string
      failed_location_count = number
      web_test_id           = string
    }))
    criteria = optional(list(object({
      aggregation = string
      dimension = optional(list(object({
        name     = string
        operator = string
        values   = list(string)
      })))
      metric_name            = string
      metric_namespace       = string
      operator               = string
      skip_metric_validation = optional(bool) # Default: false
      threshold              = number
    })))
    dynamic_criteria = optional(object({
      aggregation       = string
      alert_sensitivity = string
      dimension = optional(list(object({
        name     = string
        operator = string
        values   = list(string)
      })))
      evaluation_failure_count = optional(number) # Default: 4
      evaluation_total_count   = optional(number) # Default: 4
      ignore_data_before       = optional(string)
      metric_name              = string
      metric_namespace         = string
      operator                 = string
      skip_metric_validation   = optional(bool)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        v.criteria == null || (length(v.criteria) >= 1)
      )
    ])
    error_message = "Each criteria list must contain at least 1 items"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_monitor_metric_alert's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
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
  # path: scopes[*]
  #   source:    [from azure.ValidateResourceID] !ok
  # path: scopes[*]
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: criteria.metric_namespace
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: criteria.metric_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: criteria.aggregation
  #   condition: contains(["Average", "Count", "Minimum", "Maximum", "Total"], value)
  #   message:   must be one of: Average, Count, Minimum, Maximum, Total
  # path: criteria.dimension.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: criteria.dimension.operator
  #   condition: contains(["Include", "Exclude", "StartsWith"], value)
  #   message:   must be one of: Include, Exclude, StartsWith
  # path: criteria.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: dynamic_criteria.metric_namespace
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: dynamic_criteria.metric_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: dynamic_criteria.aggregation
  #   condition: contains(["Average", "Count", "Minimum", "Maximum", "Total"], value)
  #   message:   must be one of: Average, Count, Minimum, Maximum, Total
  # path: dynamic_criteria.dimension.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: dynamic_criteria.dimension.operator
  #   condition: contains(["Include", "Exclude", "StartsWith"], value)
  #   message:   must be one of: Include, Exclude, StartsWith
  # path: dynamic_criteria.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: dynamic_criteria.alert_sensitivity
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: dynamic_criteria.evaluation_total_count
  #   condition: value >= 1
  #   message:   must be at least 1
  # path: dynamic_criteria.evaluation_failure_count
  #   condition: value >= 1
  #   message:   must be at least 1
  # path: dynamic_criteria.ignore_data_before
  #   source:    validation.IsRFC3339Time(...) - no translation rule yet, add one
  # path: application_insights_web_test_location_availability_criteria.web_test_id
  #   source:    [from webtests.ValidateWebTestID] !ok
  # path: application_insights_web_test_location_availability_criteria.web_test_id
  #   source:    [from webtests.ValidateWebTestID] err != nil
  # path: application_insights_web_test_location_availability_criteria.component_id
  #   source:    [from components.ValidateComponentID] !ok
  # path: application_insights_web_test_location_availability_criteria.component_id
  #   source:    [from components.ValidateComponentID] err != nil
  # path: application_insights_web_test_location_availability_criteria.failed_location_count
  #   condition: value >= 1
  #   message:   must be at least 1
  # path: action.action_group_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: action.action_group_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: frequency
  #   condition: contains(["PT1M", "PT5M", "PT15M", "PT30M", "PT1H"], value)
  #   message:   must be one of: PT1M, PT5M, PT15M, PT30M, PT1H
  # path: severity
  #   condition: value >= 0 && value <= 4
  #   message:   must be between 0 and 4
  # path: window_size
  #   condition: contains(["PT1M", "PT5M", "PT15M", "PT30M", "PT1H", "PT6H", "PT12H", "P1D"], value)
  #   message:   must be one of: PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D
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

