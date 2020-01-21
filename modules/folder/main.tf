data "google_organization" "org" {
  domain = var.domain
}

resource "google_folder" "local" {
  display_name = var.name
  parent       = coalesce(var.parent_id, data.google_organization.org.name)
}

resource "google_folder_iam_binding" "local" {
  count = var.gsuite_group_email != "${var.mock_gsuite_group_name}@${var.domain}" ? 1 : 0

  folder = google_folder.local.id
  role   = var.iam_role

  members = [
    "group:${var.gsuite_group_email}",
  ]
}
