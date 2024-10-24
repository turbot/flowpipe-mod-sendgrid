pipeline "delete_contact_list" {
  title       = "Delete Contact List"
  description = "Allows you to delete a specific list."

  param "conn" {
    type        = connection.sendgrid
    description = local.conn_param_description
    default     = connection.sendgrid.default
  }

  param "list_id" {
    type        = string
    description = "The ID of the list you want to delete."
  }

  step "http" "delete_contact_list" {
    method = "delete"
    url    = "https://api.sendgrid.com/v3/marketing/lists/${param.list_id}"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${param.conn.api_key}"
    }
  }
}
