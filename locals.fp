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
  api_key_param_description = "SendGrid API key used for authentication."
}
