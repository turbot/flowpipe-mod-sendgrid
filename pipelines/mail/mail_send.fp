pipeline "mail_send" {
  title       = "Mail Send"
  description = "Send email over SendGrid."

  tags = {
    type = "featured"
  }

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
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

  step "http" "mail_send" {
    method = "post"
    url    = "https://api.sendgrid.com/v3/mail/send"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${credential.sendgrid[param.cred].api_key}"
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
