pipeline "list_contacts" {
  title       = "List contacts"
  description = "Returns up to 50 of the most recent contacts uploaded or attached to a list."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  step "http" "list_contacts" {
    method = "get"
    url    = "https://api.sendgrid.com/v3/marketing/contacts"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${credential.sendgrid[param.cred].api_key}"
    }
  }

  output "contacts" {
    description = "List of contacts."
    value       = step.http.list_contacts.response_body.result
  }

}
