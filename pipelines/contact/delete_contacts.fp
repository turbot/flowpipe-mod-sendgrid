pipeline "delete_contacts" {
  title       = "Delete Contacts"
  description = "Can be used to delete one or more contacts."

  tags = {
    type = "featured"
  }

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  param "ids" {
    type        = string
    description = "A comma-separated list of contact IDs."
  }

  step "http" "delete_contacts" {
    method = "delete"
    url    = "https://api.sendgrid.com/v3/marketing/contacts?ids=${urlencode(param.ids)}"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${credential.sendgrid[param.cred].api_key}"
    }
  }
}
