output "monitor_metric_alerts" {
  description = "All monitor_metric_alert resources"
  value       = azurerm_monitor_metric_alert.monitor_metric_alerts
}
output "monitor_metric_alerts_action" {
  description = "List of action values across all monitor_metric_alerts"
  value       = [for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : v.action]
}
output "monitor_metric_alerts_application_insights_web_test_location_availability_criteria" {
  description = "List of application_insights_web_test_location_availability_criteria values across all monitor_metric_alerts"
  value       = [for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : v.application_insights_web_test_location_availability_criteria]
}
output "monitor_metric_alerts_auto_mitigate" {
  description = "List of auto_mitigate values across all monitor_metric_alerts"
  value       = [for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : v.auto_mitigate]
}
output "monitor_metric_alerts_criteria" {
  description = "List of criteria values across all monitor_metric_alerts"
  value       = [for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : v.criteria]
}
output "monitor_metric_alerts_description" {
  description = "List of description values across all monitor_metric_alerts"
  value       = [for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : v.description]
}
output "monitor_metric_alerts_dynamic_criteria" {
  description = "List of dynamic_criteria values across all monitor_metric_alerts"
  value       = [for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : v.dynamic_criteria]
}
output "monitor_metric_alerts_enabled" {
  description = "List of enabled values across all monitor_metric_alerts"
  value       = [for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : v.enabled]
}
output "monitor_metric_alerts_frequency" {
  description = "List of frequency values across all monitor_metric_alerts"
  value       = [for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : v.frequency]
}
output "monitor_metric_alerts_name" {
  description = "List of name values across all monitor_metric_alerts"
  value       = [for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : v.name]
}
output "monitor_metric_alerts_resource_group_name" {
  description = "List of resource_group_name values across all monitor_metric_alerts"
  value       = [for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : v.resource_group_name]
}
output "monitor_metric_alerts_scopes" {
  description = "List of scopes values across all monitor_metric_alerts"
  value       = [for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : v.scopes]
}
output "monitor_metric_alerts_severity" {
  description = "List of severity values across all monitor_metric_alerts"
  value       = [for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : v.severity]
}
output "monitor_metric_alerts_tags" {
  description = "List of tags values across all monitor_metric_alerts"
  value       = [for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : v.tags]
}
output "monitor_metric_alerts_target_resource_location" {
  description = "List of target_resource_location values across all monitor_metric_alerts"
  value       = [for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : v.target_resource_location]
}
output "monitor_metric_alerts_target_resource_type" {
  description = "List of target_resource_type values across all monitor_metric_alerts"
  value       = [for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : v.target_resource_type]
}
output "monitor_metric_alerts_window_size" {
  description = "List of window_size values across all monitor_metric_alerts"
  value       = [for k, v in azurerm_monitor_metric_alert.monitor_metric_alerts : v.window_size]
}

