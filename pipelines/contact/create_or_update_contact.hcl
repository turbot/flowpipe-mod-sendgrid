pipeline "create_or_update_contact" {
  title       = "Create or Update a Contact"
  description = "Create or Update a contact."

  param "api_key" {
    type        = string
    default     = var.api_key
    description = local.api_key_param_description
  }

  param "city" {
    type        = string
    description = "The contact's city."
    optional    = true
  }

  param "country" {
    type        = string
    description = "The contact's country. Can be a full name or an abbreviation."
    optional    = true
  }

  param "email" {
    type        = string
    description = "The contact's primary email. This is required to be a valid email."
  }

  param "first_name" {
    type        = string
    description = "The contact's personal name."
    optional    = true
  }

  param "last_name" {
    type        = string
    description = "The contact's family name."
    optional    = true
  }

  param "postal_code" {
    type        = string
    description = "The contact's ZIP code or other postal code."
    optional    = true
  }

  param "state_province_region" {
    type        = string
    description = "The contact's state, province, or region."
    optional    = true
  }

  step "http" "create_or_update_contact" {
    title  = "Create or Update contact"
    method = "put"
    url    = "https://api.sendgrid.com/v3/marketing/contacts"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${param.api_key}"
    }

    request_body = jsonencode({
      contacts : [
        {
          city : param.city,
          country : param.country,
          email : param.email,
          first_name : param.first_name,
          last_name : param.last_name,
          postal_code : param.postal_code,
          state_province_region : param.state_province_region,
        }
      ]
    })
  }

  output "response_body" {
    value = step.http.create_or_update_contact.response_body
  }
}
