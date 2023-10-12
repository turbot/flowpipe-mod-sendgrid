// usage: flowpipe pipeline run send_email --pipeline-arg from="pipes@system.turbot.com" --pipeline-arg to="venu+test@turbot.com" --pipeline-arg subject="Flowpipe Notification Email" --pipeline-arg text="Hello World! This is an email from flowpipe pipeline."
pipeline "send_email" {
  description = "Send an email using SendGrid."

  param "api_key" {
    type    = string
    default = var.api_key
  }

  param "to" {
    type    = string
  }

  param "from" {
    type    = string
  }

  param "subject" {
    type    = string
  }

  param "text" {
    type    = string
  }

  step "http" "send_email" {
    title  = "Send an email."
    method = "post"
    url    = "https://api.sendgrid.com/v3/mail/send"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bearer ${param.api_key}"
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
          "value" : "${param.text}"
        }
      ],
      "from" : {
        "email" : "${param.from}"
      }
    })
  }

}

