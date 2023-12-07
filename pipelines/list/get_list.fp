pipeline "get_list" {
  title       = "Get List"
  description = "Returns data about a specific list."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  param "list_id" {
    type        = string
    description = "The ID of the list you want to retrieve."
  }

  step "http" "get_list" {
    method = "get"
    url    = "https://api.sendgrid.com/v3/marketing/lists/${param.id}"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${credential.sendgrid[param.cred].api_key}"
    }
  }

  output "list" {
    description = "The list details."
    value       = step.http.get_list.response_body
  }
}
