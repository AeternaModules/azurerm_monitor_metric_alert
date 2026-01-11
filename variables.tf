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
    auto_mitigate            = optional(bool, true)
    description              = optional(string)
    enabled                  = optional(bool, true)
    frequency                = optional(string, "PT1M")
    severity                 = optional(number, 3)
    tags                     = optional(map(string))
    target_resource_location = optional(string)
    target_resource_type     = optional(string)
    window_size              = optional(string, "PT5M")
    action = optional(object({
      action_group_id    = string
      webhook_properties = optional(map(string))
    }))
    application_insights_web_test_location_availability_criteria = optional(object({
      component_id          = string
      failed_location_count = number
      web_test_id           = string
    }))
    criteria = optional(object({
      aggregation = string
      dimension = optional(object({
        name     = string
        operator = string
        values   = list(string)
      }))
      metric_name            = string
      metric_namespace       = string
      operator               = string
      skip_metric_validation = optional(bool, false)
      threshold              = number
    }))
    dynamic_criteria = optional(object({
      aggregation       = string
      alert_sensitivity = string
      dimension = optional(object({
        name     = string
        operator = string
        values   = list(string)
      }))
      evaluation_failure_count = optional(number, 4)
      evaluation_total_count   = optional(number, 4)
      ignore_data_before       = optional(string)
      metric_name              = string
      metric_namespace         = string
      operator                 = string
      skip_metric_validation   = optional(bool)
    }))
  }))
}

