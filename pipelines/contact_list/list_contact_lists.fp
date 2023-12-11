pipeline "list_contact_lists" {
  title       = "List Contact Lists"
  description = "Returns an array of all of your contact lists."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  step "http" "list_contact_lists" {
    method = "get"
    url    = "https://api.sendgrid.com/v3/marketing/lists?page_size=1000"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${credential.sendgrid[param.cred].api_key}"
    }

    loop {
      until = lookup(result.response_body._metadata, "next", null) == null
      url   = lookup(result.response_body._metadata, "next", "")
    }

  }

  output "contact_lists" {
    description = "Array of all contact lists."
    value       = flatten([for entry in step.http.list_contact_lists : entry.response_body.result])
  }
}
