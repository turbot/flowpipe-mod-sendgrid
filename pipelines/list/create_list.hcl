// usage: flowpipe pipeline run  create_list --pipeline-arg "name=testlist" --execution-mode=synchronous
pipeline "create_list" {
  title       = "Create a List"
  description = "Create a list."

  param "api_key" {
    type        = string
    default     = var.api_key
    description = locals.api_key_param_description
  }

  param "name" {
    type        = string
    description = "Your name for your list."
  }

  step "http" "create_list" {
    title  = "Create list"
    method = "post"
    url    = "https://api.sendgrid.com/v3/marketing/lists"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${param.api_key}"
    }

    request_body = jsonencode({
      name = param.name
    })
  }

  output "response_body" {
    value = step.http.create_list.response_body
  }
}
