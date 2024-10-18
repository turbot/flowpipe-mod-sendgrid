pipeline "delete_contacts" {
  title       = "Delete Contacts"
  description = "Can be used to delete one or more contacts."

  tags = {
    recommended = "true"
  }

  param "conn" {
    type        = connection.sendgrid
    description = local.conn_param_description
    default     = connection.sendgrid.default
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
      Authorization = "Bearer ${param.conn.api_key}"
    }
  }
}
