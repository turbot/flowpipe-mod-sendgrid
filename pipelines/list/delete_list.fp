pipeline "delete_list" {
  title       = "Delete List"
  description = "Allows you to delete a specific list."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = var.default_cred
  }

  param "list_id" {
    type        = string
    description = "The ID of the list you want to delete."
  }

  step "http" "delete_list" {
    method = "delete"
    url    = "https://api.sendgrid.com/v3/marketing/lists/${param.list_id}"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${credential.sendgrid[param.cred].api_key}"
    }
  }
}
