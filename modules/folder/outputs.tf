output folder_id {
  value       = google_folder.local.id
  description = "Folder ID of the created GCP Folder"
}

output group_email {
  value       = gsuite_group.local[0].email
  description = "Email address of the created GSuite Group"
}

output group_name {
  value       = gsuite_group.local[0].name
  description = "Name of the created GSuite Group"
}
