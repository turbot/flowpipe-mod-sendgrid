pipeline "create_contact_list" {
  title       = "Create Contact List"
  description = "Creates a new contacts list."

  param "conn" {
    type        = connection.sendgrid
    description = local.conn_param_description
    default     = connection.sendgrid.default
  }

  param "name" {
    type        = string
    description = "Your name for your list."
  }

  step "http" "create_contact_list" {
    method = "post"
    url    = "https://api.sendgrid.com/v3/marketing/lists"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${param.conn.api_key}"
    }

    request_body = jsonencode({
      name = param.name
    })
  }

  output "contact_list" {
    description = "The newly created contact list."
    value       = step.http.create_contact_list.response_body
  }
}
