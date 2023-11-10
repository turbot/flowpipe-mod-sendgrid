pipeline "list_contacts" {
  title       = "List contacts"
  description = "List all the contacts."

  param "api_key" {
    type        = string
    default     = var.api_key
    description = local.api_key_param_description
  }

  param "filter_contact_by_email" {
    type        = string
    description = "Filter the contact by email to get the contact ID."
    optional    = true
  }

  step "http" "list_contacts" {
    title  = "List contacts"
    method = "get"
    url    = "https://api.sendgrid.com/v3/marketing/contacts"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${param.api_key}"
    }

  }

  output "contact_id" {
    description = "Filter a contact using the email."
    value       = join("", [for contact in jsondecode(step.http.list_contacts.response_body).result : contact.id if contact.email == "${param.filter_contact_by_email}"])
  }

  output "total_contacts" {
    description = "Total count of contacts."
    value       = jsondecode(step.http.list_contacts.response_body).contact_count
  }

}
