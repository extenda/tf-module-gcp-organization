output folder_id {
  value       = module.folder.folder_id
  description = "Folder ID of the created GCP Folder"
}

output group_email {
  value       = module.folder.group_email
  description = "Email address of the created GSuite Group"
}

output group_name {
  value       = module.folder.group_name
  description = "Name of the created GSuite Group"
}
