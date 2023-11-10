pipeline "delete_list" {
  title       = "Delete a List"
  description = "Delete a specific list."

  param "api_key" {
    type        = string
    default     = var.api_key
    description = local.api_key_param_description
  }

  param "id" {
    type        = string
    description = "The ID of the Event Webhook you want to delete."
  }

  step "http" "delete_list" {
    title  = "Delete list"
    method = "delete"
    url    = "https://api.sendgrid.com/v3/marketing/lists/${param.id}"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${param.api_key}"
    }
  }

  output "response_body" {
    value = step.http.delete_list.response_body
  }
}
