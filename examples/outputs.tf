output folder_id {
  value = module.organization.folder_id
  description = "Folder ID of the created GCP Folder"
}

output group_email {
  value = module.organization.group_email
  description = "Email address of the created GSuite Group"
}

output group_name {
  value = module.organization.group_name
  description = "Name of the created GSuite Group"
}
