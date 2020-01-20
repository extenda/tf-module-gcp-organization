data "google_organization" "org" {
  domain = var.domain
}

data "gsuite_group" "local" {
  email = var.gsuite_group_email
}

resource "gsuite_group" "local" {
  count = data.gsuite_group.local.name == null || data.gsuite_group.local.description == "Created by Terraform" ? 1 : 0

  email       = var.gsuite_group_email
  name        = var.gsuite_group_name
  description = "Created by Terraform"
}


resource "google_folder" "local" {
  display_name = var.name
  parent       = coalesce(var.parent_id, data.google_organization.org.name)
}

resource "google_folder_iam_binding" "local" {
  folder = google_folder.local.id
  role   = var.iam_role

  members = [
    "group:${gsuite_group.local[0].email}",
  ]
}
