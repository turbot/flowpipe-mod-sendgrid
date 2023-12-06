pipeline "get_contact_by_id" {
  title       = "Get Contact by ID"
  description = "Returns the full details and all fields for the specified contact."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = var.default_cred
  }

  param "contact_id" {
    type        = string
    description = "The ID of the contact you want to retrieve."
  }

  step "http" "get_contact_by_id" {
    method = "get"
    url    = "https://api.sendgrid.com/v3/marketing/contacts/${param.contact_id}"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${credential.sendgrid[param.cred].api_key}"
    }
  }

  output "contact" {
    description = "The contact details."
    value       = step.http.get_contact_by_id.response_body
  }
}
