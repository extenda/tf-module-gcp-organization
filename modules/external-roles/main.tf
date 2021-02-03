locals {
  group_roles = flatten([for group_key, group in var.roles_map : [
    for role_key, role in group.iam_roles : {
      project = group.project
      role    = role
    }
    ]
  ])
}

resource "google_project_iam_member" "project_roles" {
  for_each = {
    for group in local.group_roles :
    "${group.project}.${group.role}" => group
  }
  project = each.value.project
  role    = each.value.role
  member  = "group:${var.gsuite_group_name}@${var.domain}"

}
