pipeline "delete_contact" {
  title       = "Delete Contacts"
  description = "Delete a contact."

  param "api_key" {
    type        = string
    default     = var.api_key
    description = local.api_key_param_description
  }

  param "ids" {
    type        = string
    description = "A comma-separated list of contact IDs."
  }

  step "http" "delete_contact" {
    title  = "Delete Contact"
    method = "delete"
    url    = "https://api.sendgrid.com/v3/marketing/contacts?ids=${urlencode(param.ids)}"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${param.api_key}"
    }

  }

  output "response_body" {
    value = step.http.delete_contact.response_body
  }
}
