data "googleworkspace_group" "local" {
  email  = var.email
}

resource "googleworkspace_group" "local" {
  count = var.name != var.mock_name && (data.googleworkspace_group.local.name == null || data.googleworkspace_group.local.description == "Created by Terraform") ? 1 : 0

  aliases     = var.group_aliases
  email       = var.email
  name        = var.name
  description = "Created by Terraform"
}

resource "googleworkspace_group_members" "local_users" {
  count = var.name != var.mock_name && (data.googleworkspace_group.local.name == null || data.googleworkspace_group.local.description == "Created by Terraform") && (length(var.members.groups) > 0 || length(var.members.users) > 0)? 1 : 0
  group_id = googleworkspace_group.local[0].id

  dynamic members {
    for_each = var.members.groups

    content {
      email = members.value.email
      role  = "MEMBER"
    }
  }

  dynamic members {
    for_each = var.members.users

    content {
      email = members.value.email
      role  = "MEMBER"
    }
  }
}
