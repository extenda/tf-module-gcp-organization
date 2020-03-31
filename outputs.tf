output folder_id {
  value       = module.folder.id
  description = "Folder ID of the created GCP Folder"
}

output group_email {
  value       = module.group.email
  description = "Email address of the created GSuite Group"
}

output group_name {
  value       = module.group.name
  description = "Name of the created GSuite Group"
}

output lead_group_email {
  value       = module.lead_group.email
  description = "Email address of the created GSuite Lead Group"
}

output lead_group_name {
  value       = module.lead_group.name
  description = "Name of the created GSuite Lead Group"
}
