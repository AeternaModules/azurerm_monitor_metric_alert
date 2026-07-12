output "monitor_metric_alerts_action" {
  description = "Map of action values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.action }
}
output "monitor_metric_alerts_application_insights_web_test_location_availability_criteria" {
  description = "Map of application_insights_web_test_location_availability_criteria values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.application_insights_web_test_location_availability_criteria }
}
output "monitor_metric_alerts_auto_mitigate" {
  description = "Map of auto_mitigate values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.auto_mitigate }
}
output "monitor_metric_alerts_criteria" {
  description = "Map of criteria values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.criteria }
}
output "monitor_metric_alerts_description" {
  description = "Map of description values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.description }
}
output "monitor_metric_alerts_dynamic_criteria" {
  description = "Map of dynamic_criteria values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.dynamic_criteria }
}
output "monitor_metric_alerts_enabled" {
  description = "Map of enabled values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.enabled }
}
output "monitor_metric_alerts_frequency" {
  description = "Map of frequency values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.frequency }
}
output "monitor_metric_alerts_name" {
  description = "Map of name values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.name }
}
output "monitor_metric_alerts_resource_group_name" {
  description = "Map of resource_group_name values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.resource_group_name }
}
output "monitor_metric_alerts_scopes" {
  description = "Map of scopes values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.scopes }
}
output "monitor_metric_alerts_severity" {
  description = "Map of severity values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.severity }
}
output "monitor_metric_alerts_tags" {
  description = "Map of tags values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.tags }
}
output "monitor_metric_alerts_target_resource_location" {
  description = "Map of target_resource_location values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.target_resource_location }
}
output "monitor_metric_alerts_target_resource_type" {
  description = "Map of target_resource_type values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.target_resource_type }
}
output "monitor_metric_alerts_window_size" {
  description = "Map of window_size values across all monitor_metric_alerts, keyed the same as var.monitor_metric_alerts"
  value       = { for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : k => v.window_size }
}

