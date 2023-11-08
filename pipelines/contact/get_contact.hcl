pipeline "get_contact" {
  title       = "Get a Contact by ID"
  description = "Get contact details by ID."

  param "api_key" {
    type        = string
    default     = var.api_key
    description = local.api_key_param_description
  }

  param "id" {
    type        = string
    description = "The ID of a contact."
  }

  step "http" "get_contact" {
    title  = "Get Contact"
    method = "get"
    url    = "https://api.sendgrid.com/v3/marketing/contacts/${param.id}"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${param.api_key}"
    }
  }

  output "response_body" {
    value = step.http.get_contact.response_body
  }

}
