// usage: flowpipe pipeline run delete_list --pipeline-arg "id=8b903b6d-8f44-1234-d456-a7849bd7f967" --execution-mode=synchronous 
pipeline "delete_list" {
  title       = "Delete a list"
  description = "Create an email in contact."

  param "api_key" {
    type        = string
    default     = var.api_key
    description = "SendGrid API key used for authentication."
  }

  param "id" {
    type        = string
    description = "Your name for your list."
  }

  // I tested this but it is not deleting the contacts in the list! 
  // param "delete_contacts" {
  //   type        = bool
  //   description = "Flag indicates that all contacts on the list are also to be deleted."
  //   optional    = true
  // }

  step "http" "delete_list" {
    title  = "Create contact"
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
