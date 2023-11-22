pipeline "update_list" {
  title       = "Update List"
  description = "Updates the name of a list."

  param "api_key" {
    type        = string
    default     = var.api_key
    description = local.api_key_param_description
  }

  param "id" {
    type        = string
    description = "The ID of the Event Webhook you want to update."
  }

  param "name" {
    type        = string
    description = "The updated name for your list."
  }

  step "http" "update_list" {
    title  = "Update list"
    method = "patch"
    url    = "https://api.sendgrid.com/v3/marketing/lists/${param.id}"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${param.api_key}"
    }

    request_body = jsonencode({
      name = param.name
    })
  }

  output "response_body" {
    value = step.http.update_list.response_body
  }
}
