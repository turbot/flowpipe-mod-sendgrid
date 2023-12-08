pipeline "update_list" {
  title       = "Update List"
  description = "Updates the name of a list."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  param "list_id" {
    type        = string
    description = "The ID of the Event Webhook you want to update."
  }

  param "name" {
    type        = string
    description = "The updated name for your list."
  }

  step "http" "update_list" {
    method = "patch"
    url    = "https://api.sendgrid.com/v3/marketing/lists/${param.id}"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${credential.sendgrid[param.cred].api_key}"
    }

    request_body = jsonencode({
      name = param.name
    })
  }

  output "list" {
    description = "The updated list."
    value       = step.http.update_list.response_body
  }
}
