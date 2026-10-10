output "phone_providers_id" {
  description = "Map of id values across all phone_providers, keyed the same as var.phone_providers except keys with no id are omitted"
  value       = { for k, v in auth0_phone_provider.phone_providers : k => v.id if v.id != null && length(v.id) > 0 }
}
output "phone_providers_channel" {
  description = "Map of channel values across all phone_providers, keyed the same as var.phone_providers except keys with no channel are omitted"
  value       = { for k, v in auth0_phone_provider.phone_providers : k => v.channel if v.channel != null && length(v.channel) > 0 }
}
output "phone_providers_configuration" {
  description = "Map of configuration values across all phone_providers, keyed the same as var.phone_providers except keys with no configuration are omitted"
  value       = { for k, v in auth0_phone_provider.phone_providers : k => one(v.configuration) if v.configuration != null && length(v.configuration) > 0 }
}
output "phone_providers_credentials" {
  description = "Map of credentials values across all phone_providers, keyed the same as var.phone_providers except keys with no credentials are omitted"
  value       = { for k, v in auth0_phone_provider.phone_providers : k => one(v.credentials) if v.credentials != null && length(v.credentials) > 0 }
  sensitive   = true
}
output "phone_providers_disabled" {
  description = "Map of disabled values across all phone_providers, keyed the same as var.phone_providers except keys with no disabled are omitted"
  value       = { for k, v in auth0_phone_provider.phone_providers : k => v.disabled if v.disabled != null }
}
output "phone_providers_name" {
  description = "Map of name values across all phone_providers, keyed the same as var.phone_providers except keys with no name are omitted"
  value       = { for k, v in auth0_phone_provider.phone_providers : k => v.name if v.name != null && length(v.name) > 0 }
}
output "phone_providers_tenant" {
  description = "Map of tenant values across all phone_providers, keyed the same as var.phone_providers except keys with no tenant are omitted"
  value       = { for k, v in auth0_phone_provider.phone_providers : k => v.tenant if v.tenant != null && length(v.tenant) > 0 }
}

