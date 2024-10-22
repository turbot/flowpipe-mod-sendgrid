pipeline "list_contacts" {
  title       = "List Contacts"
  description = "Returns up to 50 of the most recent contacts uploaded or attached to a list."

  tags = {
    recommended = "true"
  }

  param "conn" {
    type        = connection.sendgrid
    description = local.conn_param_description
    default     = connection.sendgrid.default
  }

  step "http" "list_contacts" {
    method = "get"
    url    = "https://api.sendgrid.com/v3/marketing/contacts"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${param.conn.api_key}"
    }
  }

  output "contacts" {
    description = "List of contacts."
    value       = step.http.list_contacts.response_body.result
  }
}
