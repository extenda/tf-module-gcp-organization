resource "googleworkspace_group" "local" {
  count = var.create_group ? 1 : 0

  aliases     = var.group_aliases
  email       = var.email
  name        = var.name
  description = "Created by Terraform"
}

resource "googleworkspace_group_members" "local_users" {
  count = var.create_group ? 1 : 0

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

  depends_on = [
    googleworkspace_group.local
  ]
}
