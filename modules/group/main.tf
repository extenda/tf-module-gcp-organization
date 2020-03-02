data "gsuite_group" "local" {
  email  = var.email
}

resource "gsuite_group" "local" {
  count = var.name != var.mock_name && (data.gsuite_group.local.name == null || data.gsuite_group.local.description == "Created by Terraform") ? 1 : 0

  email       = var.email
  name        = var.name
  description = "Created by Terraform"
}

resource "gsuite_group_members" "local_users" {
  count = var.name != var.mock_name && (data.gsuite_group.local.name == null || data.gsuite_group.local.description == "Created by Terraform") ? 1 : 0
  group_email = "${gsuite_group.local[0].email}"

  dynamic "member" {
    for_each = var.members.groups

    content {
      email = member.value.email
      role  = "MEMBER"
    }
  }

  dynamic "member" {
    for_each = var.members.users

    content {
      email = member.value.email
      role  = "MEMBER"
    }
  }
}