provider "google" {
  version     = "~> 2.7"
  region      = "europe-west-1"
}

## GSuite Provider must be installed manually. 
## Instructions can be found here https://github.com/DeviaVir/terraform-provider-gsuite#installation
provider "gsuite" {
  impersonated_user_email = local.impersonated_user_email

  oauth_scopes = [
    "https://www.googleapis.com/auth/admin.directory.user",
    "https://www.googleapis.com/auth/admin.directory.group",
    "https://www.googleapis.com/auth/admin.directory.group.member"
  ]

  version = "~> 0.1.35"
}
