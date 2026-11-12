output "phone_providers_id" {
  description = "Map of id values across all phone_providers, keyed the same as var.phone_providers"
  value       = { for k, v in auth0_phone_provider.phone_providers : k => v.id }
}
output "phone_providers_channel" {
  description = "Map of channel values across all phone_providers, keyed the same as var.phone_providers"
  value       = { for k, v in auth0_phone_provider.phone_providers : k => v.channel }
}
output "phone_providers_configuration" {
  description = "Map of configuration values across all phone_providers, keyed the same as var.phone_providers"
  value       = { for k, v in auth0_phone_provider.phone_providers : k => one(v.configuration) }
}
output "phone_providers_credentials" {
  description = "Map of credentials values across all phone_providers, keyed the same as var.phone_providers"
  value       = { for k, v in auth0_phone_provider.phone_providers : k => one(v.credentials) }
  sensitive   = true
}
output "phone_providers_disabled" {
  description = "Map of disabled values across all phone_providers, keyed the same as var.phone_providers"
  value       = { for k, v in auth0_phone_provider.phone_providers : k => v.disabled }
}
output "phone_providers_name" {
  description = "Map of name values across all phone_providers, keyed the same as var.phone_providers"
  value       = { for k, v in auth0_phone_provider.phone_providers : k => v.name }
}
output "phone_providers_tenant" {
  description = "Map of tenant values across all phone_providers, keyed the same as var.phone_providers"
  value       = { for k, v in auth0_phone_provider.phone_providers : k => v.tenant }
}

