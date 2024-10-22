locals {
  add_contact_common_params = {
    city                  = "city"
    country               = "country"
    email                 = "email"
    first_name            = "first_name"
    last_name             = "last_name"
    postal_code           = "postal_code"
    state_province_region = "state_province_region"
  }
}

# Common descriptions
locals {
  conn_param_description = "Name of SendGrid connection to use. If not provided, the default SendGrid connection will be used."
}
