mod "sendgrid" {
  title         = "SendGrid"
  description   = "Run pipelines to supercharge your SendGrid workflows using Flowpipe."
  color         = "#1A82E2"
  documentation = file("./README.md")
  icon          = "/images/mods/turbot/sendgrid.svg"
  categories    = ["library", "messaging"]

  opengraph {
    title       = "SendGrid Mod for Flowpipe"
    description = "Run pipelines to supercharge your SendGrid workflows using Flowpipe."
    image       = "/images/mods/turbot/sendgrid-social-graphic.png"
  }

  require {
    flowpipe {
      min_version = "1.0.0"
    }
  }
}
