// usage: flowpipe pipeline run list_lists --execution-mode=synchronous
pipeline "list_lists" {
  title       = "Get All Lists"
  description = "List all the lists."

  param "api_key" {
    type        = string
    default     = var.api_key
    description = locals.api_key_param_description
  }

  step "http" "list_lists" {
    title  = "List Lists"
    method = "get"
    url    = "https://api.sendgrid.com/v3/marketing/lists"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${param.api_key}"
    }
  }

  output "total_lists" {
    description = "Total count of lists."
    value       = jsondecode(step.http.list_lists.response_body)._metadata.count
  }

}
