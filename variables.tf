variable "phone_providers" {
  description = <<EOT
Map of phone_providers, attributes below
Required:
    - name
    - configuration (block):
        - default_from (optional)
        - delivery_methods (required)
        - mssid (optional)
        - sid (optional)
    - credentials (block):
        - auth_token (optional)
Optional:
    - disabled
EOT

  type = map(object({
    name     = string
    disabled = optional(bool)
    configuration = object({
      default_from     = optional(string)
      delivery_methods = set(string)
      mssid            = optional(string)
      sid              = optional(string)
    })
    credentials = object({
      auth_token = optional(string)
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.phone_providers : (
        contains(["twilio", "custom"], v.name)
      )
    ])
    error_message = "must be one of: \"twilio\", \"custom\""
  }
  validation {
    condition = alltrue([
      for k, v in var.phone_providers : (
        v.credentials.auth_token == null || (length(v.credentials.auth_token) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.phone_providers : (
        v.configuration.default_from == null || (length(v.configuration.default_from) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.phone_providers : (
        v.configuration.mssid == null || (length(v.configuration.mssid) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.phone_providers : (
        v.configuration.sid == null || (length(v.configuration.sid) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

