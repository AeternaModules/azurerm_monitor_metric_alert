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
    auto_mitigate            = optional(bool)
    description              = optional(string)
    enabled                  = optional(bool)
    frequency                = optional(string)
    severity                 = optional(number)
    tags                     = optional(map(string))
    target_resource_location = optional(string)
    target_resource_type     = optional(string)
    window_size              = optional(string)
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
      skip_metric_validation = optional(bool)
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
      evaluation_failure_count = optional(number)
      evaluation_total_count   = optional(number)
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
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        v.criteria == null || alltrue([for item in v.criteria : (length(item.metric_namespace) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        v.criteria == null || alltrue([for item in v.criteria : (length(item.metric_name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        v.criteria == null || alltrue([for item in v.criteria : (contains(["Average", "Count", "Minimum", "Maximum", "Total"], item.aggregation))])
      )
    ])
    error_message = "must be one of: Average, Count, Minimum, Maximum, Total"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        v.criteria == null || alltrue([for item in v.criteria : (item.dimension == null || alltrue([for item in item.dimension : (length(item.name) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        v.criteria == null || alltrue([for item in v.criteria : (item.dimension == null || alltrue([for item in item.dimension : (contains(["Include", "Exclude", "StartsWith"], item.operator))]))])
      )
    ])
    error_message = "must be one of: Include, Exclude, StartsWith"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        v.dynamic_criteria == null || (length(v.dynamic_criteria.metric_namespace) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        v.dynamic_criteria == null || (length(v.dynamic_criteria.metric_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        v.dynamic_criteria == null || (contains(["Average", "Count", "Minimum", "Maximum", "Total"], v.dynamic_criteria.aggregation))
      )
    ])
    error_message = "must be one of: Average, Count, Minimum, Maximum, Total"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        v.dynamic_criteria == null || (v.dynamic_criteria.dimension == null || alltrue([for item in v.dynamic_criteria.dimension : (length(item.name) > 0)]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        v.dynamic_criteria == null || (v.dynamic_criteria.dimension == null || alltrue([for item in v.dynamic_criteria.dimension : (contains(["Include", "Exclude", "StartsWith"], item.operator))]))
      )
    ])
    error_message = "must be one of: Include, Exclude, StartsWith"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        v.dynamic_criteria == null || (v.dynamic_criteria.evaluation_total_count == null || (v.dynamic_criteria.evaluation_total_count >= 1))
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        v.dynamic_criteria == null || (v.dynamic_criteria.evaluation_failure_count == null || (v.dynamic_criteria.evaluation_failure_count >= 1))
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        v.application_insights_web_test_location_availability_criteria == null || (v.application_insights_web_test_location_availability_criteria.failed_location_count >= 1)
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        v.frequency == null || (contains(["PT1M", "PT5M", "PT15M", "PT30M", "PT1H"], v.frequency))
      )
    ])
    error_message = "must be one of: PT1M, PT5M, PT15M, PT30M, PT1H"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        v.severity == null || (v.severity >= 0 && v.severity <= 4)
      )
    ])
    error_message = "must be between 0 and 4"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        v.window_size == null || (contains(["PT1M", "PT5M", "PT15M", "PT30M", "PT1H", "PT6H", "PT12H", "P1D"], v.window_size))
      )
    ])
    error_message = "must be one of: PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_metric_alerts : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 16 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

