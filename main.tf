locals {
  impersonated_user_email = coalesce(var.impersonated_user_email, format("%s@%s", "terraform", var.domain))
  gsuite_group_name       = coalesce(var.gsuite_group_name, var.mock_gsuite_group_name)
  gsuite_group_email      = format("%s@%s", local.gsuite_group_name, var.domain)
}

module group {
  source = "./modules/group"
  
  name      = local.gsuite_group_name
  mock_name = var.mock_gsuite_group_name
  email     = local.gsuite_group_email
  members   = var.gsuite_group_members
}

module folder {
  source = "./modules/folder"

  name      = var.folder_name
  parent_id = var.folder_parent_id
  domain    = var.domain

  folder_view_iam_role        = var.folder_view_iam_role
  iam_roles                   = var.folder_iam_roles
  additional_iam_member_bindings = var.folder_additional_iam_member_bindings
  gsuite_group_email          = local.gsuite_group_email
  mock_gsuite_group_name      = var.mock_gsuite_group_name
}

module external-roles {
  source = "./modules/external-roles"

  domain              = var.domain
  roles_map           = var.roles_map
  gsuite_group_name   = var.gsuite_group_name
}
