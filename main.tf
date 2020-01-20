locals {
  impersonated_user_email = coalesce(var.impersonated_user_email, format("%s@%s", "terraform", var.domain))
  gsuite_group_email      = format("%s@%s", var.gsuite_group_name, var.domain)
}

module folder {
  source = "./modules/folder"

  name      = var.folder_name
  parent_id = var.folder_parent_id
  domain    = var.domain

  gsuite_group_email = local.gsuite_group_email
  gsuite_group_name  = var.gsuite_group_name

  iam_role = var.folder_iam_role
}
