resource "azurerm_monitor_metric_alert" "monitor_metric_alerts" {
  for_each = var.monitor_metric_alerts

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  scopes                   = each.value.scopes
  auto_mitigate            = each.value.auto_mitigate
  description              = each.value.description
  enabled                  = each.value.enabled
  frequency                = each.value.frequency
  severity                 = each.value.severity
  tags                     = each.value.tags
  target_resource_location = each.value.target_resource_location
  target_resource_type     = each.value.target_resource_type
  window_size              = each.value.window_size

  dynamic "action" {
    for_each = each.value.action != null ? each.value.action : []
    content {
      action_group_id    = action.value.action_group_id
      webhook_properties = action.value.webhook_properties
    }
  }

  dynamic "application_insights_web_test_location_availability_criteria" {
    for_each = each.value.application_insights_web_test_location_availability_criteria != null ? [each.value.application_insights_web_test_location_availability_criteria] : []
    content {
      component_id          = application_insights_web_test_location_availability_criteria.value.component_id
      failed_location_count = application_insights_web_test_location_availability_criteria.value.failed_location_count
      web_test_id           = application_insights_web_test_location_availability_criteria.value.web_test_id
    }
  }

  dynamic "criteria" {
    for_each = each.value.criteria != null ? each.value.criteria : []
    content {
      aggregation = criteria.value.aggregation
      dynamic "dimension" {
        for_each = criteria.value.dimension != null ? criteria.value.dimension : []
        content {
          name     = dimension.value.name
          operator = dimension.value.operator
          values   = dimension.value.values
        }
      }
      metric_name            = criteria.value.metric_name
      metric_namespace       = criteria.value.metric_namespace
      operator               = criteria.value.operator
      skip_metric_validation = criteria.value.skip_metric_validation
      threshold              = criteria.value.threshold
    }
  }

  dynamic "dynamic_criteria" {
    for_each = each.value.dynamic_criteria != null ? [each.value.dynamic_criteria] : []
    content {
      aggregation       = dynamic_criteria.value.aggregation
      alert_sensitivity = dynamic_criteria.value.alert_sensitivity
      dynamic "dimension" {
        for_each = dynamic_criteria.value.dimension != null ? dynamic_criteria.value.dimension : []
        content {
          name     = dimension.value.name
          operator = dimension.value.operator
          values   = dimension.value.values
        }
      }
      evaluation_failure_count = dynamic_criteria.value.evaluation_failure_count
      evaluation_total_count   = dynamic_criteria.value.evaluation_total_count
      ignore_data_before       = dynamic_criteria.value.ignore_data_before
      metric_name              = dynamic_criteria.value.metric_name
      metric_namespace         = dynamic_criteria.value.metric_namespace
      operator                 = dynamic_criteria.value.operator
      skip_metric_validation   = dynamic_criteria.value.skip_metric_validation
    }
  }
}

