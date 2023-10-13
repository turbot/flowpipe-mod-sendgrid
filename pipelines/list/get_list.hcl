// usage: flowpipe pipeline run get_list --pipeline-arg "id=504c6e04-f2e9-1234-a456-a4dde6574a42" --execution-mode=synchronous
pipeline "get_list" {
  title       = "Get a List by ID"
  description = "Get contact details by ID."

  param "api_key" {
    type        = string
    default     = var.api_key
    description = "SendGrid API key used for authentication."
  }

  param "id" {
    type        = string
    description = "The ID of a list."
  }

  step "http" "get_list" {
    title  = "Get List"
    method = "get"
    url    = "https://api.sendgrid.com/v3/marketing/lists/${param.id}"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${param.api_key}"
    }
  }

  output "response_body" {
    value = step.http.get_list.response_body
  }

}
