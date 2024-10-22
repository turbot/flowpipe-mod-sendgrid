pipeline "update_contact_list" {
  title       = "Update Contact List"
  description = "Updates the name of a list."

  param "conn" {
    type        = connection.sendgrid
    description = local.conn_param_description
    default     = connection.sendgrid.default
  }

  param "list_id" {
    type        = string
    description = "The ID of the Event Webhook you want to update."
  }

  param "name" {
    type        = string
    description = "The updated name for your list."
  }

  step "http" "update_contact_list" {
    method = "patch"
    url    = "https://api.sendgrid.com/v3/marketing/lists/${param.id}"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${param.conn.api_key}"
    }

    request_body = jsonencode({
      name = param.name
    })
  }

  output "contact_list" {
    description = "The updated contact list."
    value       = step.http.update_contact_list.response_body
  }
}
