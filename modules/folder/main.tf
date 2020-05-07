locals {
  iam_roles = concat([var.folder_view_iam_role], var.iam_roles)
}

data "google_organization" "org" {
  domain = var.domain
}

resource "google_folder" "local" {
  display_name = var.name
  parent       = coalesce(var.parent_id, data.google_organization.org.name)
}

resource "google_folder_iam_binding" "local" {
  for_each = {
    for key, value in local.iam_roles :
    key => key
    if var.gsuite_group_email != "${var.mock_gsuite_group_name}@${var.domain}"
  }

  folder = google_folder.local.id
  role   = local.iam_roles[each.value]

  members = [
    "group:${var.gsuite_group_email}",
  ]
}

module "additional_iam_bindings" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "6.1.0"
  
  mode     = "additive"
  folders  = [google_folder.local.id]
  bindings = var.additional_iam_bindings
}
