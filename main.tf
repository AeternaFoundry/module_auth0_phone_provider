resource "auth0_phone_provider" "phone_providers" {
  for_each = var.phone_providers

  name     = each.value.name
  disabled = each.value.disabled

  configuration {
    default_from     = each.value.configuration.default_from
    delivery_methods = each.value.configuration.delivery_methods
    mssid            = each.value.configuration.mssid
    sid              = each.value.configuration.sid
  }

  credentials {
    auth_token = each.value.credentials.auth_token
  }
}

