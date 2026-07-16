output "monitor_metric_alerts_id" {
  description = "Map of id values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.id if v.id != null && length(v.id) > 0 }
}
output "monitor_metric_alerts_action" {
  description = "Map of action values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.action if v.action != null && length(v.action) > 0 }
}
output "monitor_metric_alerts_application_insights_web_test_location_availability_criteria" {
  description = "Map of application_insights_web_test_location_availability_criteria values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.application_insights_web_test_location_availability_criteria if v.application_insights_web_test_location_availability_criteria != null && length(v.application_insights_web_test_location_availability_criteria) > 0 }
}
output "monitor_metric_alerts_auto_mitigate" {
  description = "Map of auto_mitigate values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.auto_mitigate if v.auto_mitigate != null }
}
output "monitor_metric_alerts_criteria" {
  description = "Map of criteria values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.criteria if v.criteria != null && length(v.criteria) > 0 }
}
output "monitor_metric_alerts_description" {
  description = "Map of description values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.description if v.description != null && length(v.description) > 0 }
}
output "monitor_metric_alerts_dynamic_criteria" {
  description = "Map of dynamic_criteria values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.dynamic_criteria if v.dynamic_criteria != null && length(v.dynamic_criteria) > 0 }
}
output "monitor_metric_alerts_enabled" {
  description = "Map of enabled values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.enabled if v.enabled != null }
}
output "monitor_metric_alerts_frequency" {
  description = "Map of frequency values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.frequency if v.frequency != null && length(v.frequency) > 0 }
}
output "monitor_metric_alerts_name" {
  description = "Map of name values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.name if v.name != null && length(v.name) > 0 }
}
output "monitor_metric_alerts_resource_group_name" {
  description = "Map of resource_group_name values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "monitor_metric_alerts_scopes" {
  description = "Map of scopes values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.scopes if v.scopes != null && length(v.scopes) > 0 }
}
output "monitor_metric_alerts_severity" {
  description = "Map of severity values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.severity if v.severity != null }
}
output "monitor_metric_alerts_tags" {
  description = "Map of tags values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "monitor_metric_alerts_target_resource_location" {
  description = "Map of target_resource_location values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.target_resource_location if v.target_resource_location != null && length(v.target_resource_location) > 0 }
}
output "monitor_metric_alerts_target_resource_type" {
  description = "Map of target_resource_type values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.target_resource_type if v.target_resource_type != null && length(v.target_resource_type) > 0 }
}
output "monitor_metric_alerts_window_size" {
  description = "Map of window_size values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.window_size if v.window_size != null && length(v.window_size) > 0 }
}

