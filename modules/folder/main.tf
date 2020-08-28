locals {
  iam_roles = concat([var.folder_view_iam_role], var.iam_roles)

  # For details on this solution for producing a map/object from nested loop to support for_each in resource block
  # see https://github.com/hashicorp/terraform/issues/22263#issuecomment-581205359
  additional_iam_member_bindings_association_list = flatten([
    for member, roles in var.additional_iam_member_bindings : [
      for role in roles : {
        "${member}-${role}" = {
          "member" = member
          "role"   = role
        }
      }
    ]
  ])

  additional_iam_member_bindings_association_map = { 
    for item in local.additional_iam_member_bindings_association_list : 
      keys(item)[0] => values(item)[0]
  }
}

data "google_organization" "org" {
  domain = var.domain
}

resource "google_folder" "local" {
  display_name = var.name
  parent       = coalesce(var.parent_id, data.google_organization.org.name)
}

resource "google_folder_iam_member" "local" {
  for_each = {
    for key, value in local.iam_roles :
    value => key
    if var.gsuite_group_email != "${var.mock_gsuite_group_name}@${var.domain}"
  }

  folder = google_folder.local.id
  role   = local.iam_roles[each.value]
  member = "group:${var.gsuite_group_email}"
}

resource "google_folder_iam_member" "additional" {
  for_each = local.additional_iam_member_bindings_association_map

  folder = google_folder.local.id
  role   = each.value.role
  member = each.value.member
}
