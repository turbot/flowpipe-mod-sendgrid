pipeline "send_mail" {
  title       = "Send Mail"
  description = "Send email over SendGrid."

  tags = {
    type = "featured"
  }

  param "conn" {
    type        = connection.sendgrid
    description = local.conn_param_description
    default     = connection.sendgrid.default
  }

  param "to" {
    type        = string
    description = "The intended recipient's email address."
  }

  param "from" {
    type        = string
    description = "The 'From' email address used to deliver the message. This address should be a verified sender in your Twilio SendGrid account."
  }

  param "subject" {
    type        = string
    description = "The global or 'message level' subject of your email."
  }

  param "content" {
    type        = string
    description = "The body of the email."
  }

  step "http" "send_mail" {
    method = "post"
    url    = "https://api.sendgrid.com/v3/mail/send"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${param.conn.api_key}"
    }

    request_body = jsonencode({
      "personalizations" : [
        {
          "to" : [{ "email" : "${param.to}" }]
        }
      ],
      "subject" : "${param.subject}",
      "content" : [
        {
          "type" : "text/plain",
          "value" : "${param.content}"
        }
      ],
      "from" : {
        "email" : "${param.from}"
      }
    })
  }
}
