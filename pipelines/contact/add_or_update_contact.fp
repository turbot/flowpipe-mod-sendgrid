pipeline "add_or_update_contact" {
  title       = "Add or Update Contact"
  description = "Allows the upsert (insert or update) of contacts."

  tags = {
    type = "featured"
  }

  param "conn" {
    type        = connection.sendgrid
    description = local.conn_param_description
    default     = connection.sendgrid.default
  }

  param "email" {
    type        = string
    description = "The contact's primary email. This is required to be a valid email."
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

  step "http" "add_or_update_contact" {
    method = "put"
    url    = "https://api.sendgrid.com/v3/marketing/contacts"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${param.conn.api_key}"
    }

    request_body = jsonencode({
      contacts : [{
        for name, value in param : try(local.add_contact_common_params[name], name) => value if contains(keys(local.add_contact_common_params), name) && value != null
      }]
    })
  }

  output "job_id" {
    description = "Indicates that the contacts are queued for processing."
    value       = step.http.add_or_update_contact.response_body
  }
}
