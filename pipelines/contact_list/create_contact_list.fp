pipeline "create_contact_list" {
  title       = "Create Contact List"
  description = "Creates a new contacts list."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
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
      Authorization = "Bearer ${credential.sendgrid[param.cred].api_key}"
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
