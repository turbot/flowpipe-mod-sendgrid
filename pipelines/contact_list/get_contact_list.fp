pipeline "get_contact_list" {
  title       = "Get Contact List"
  description = "Returns data about a specific list."

  param "conn" {
    type        = connection.sendgrid
    description = local.conn_param_description
    default     = connection.sendgrid.default
  }

  param "list_id" {
    type        = string
    description = "The ID of the list you want to retrieve."
  }

  step "http" "get_contact_list" {
    method = "get"
    url    = "https://api.sendgrid.com/v3/marketing/lists/${param.id}"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${param.conn.api_key}"
    }
  }

  output "contact_list" {
    description = "The contact list details."
    value       = step.http.get_contact_list.response_body
  }
}
