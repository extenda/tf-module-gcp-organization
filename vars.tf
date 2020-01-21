variable folder_name {
  type        = string
  description = "The name of the GCP Folder to create"
}

variable folder_parent_id {
  type        = string
  default     = ""
  description = "The ID of the Parent Folder in which to create the new Folder. If not provided, Folder will be created at the root of the Organization."
}

variable folder_iam_role {
  default     = "roles/resourcemanager.folderViewer"
  description = "The IAM Role to grant the Group we bind to the GCP Folder"
}

variable impersonated_user_email {
  type        = string
  default     = ""
  description = "Email account of GSuite Admin user to impersonate for creating GSuite Groups. If not provided, will default to `terraform@<var.domain>`"
}

variable domain {
  type        = string
  description = "Domain name of the Organization in which to create the Folder."
}

variable gsuite_group_name {
  type        = string
  default     = ""
  description = "Name of GSuite Group. If none provided then no GSuite group will be created nor bound to the Folder."
}

variable mock_gsuite_group_name {
  type        = string
  default     = "placeholder-123"
  description = "Due limitations with Terraform Count and data resource lookups we must use a mock email address instead of an empty value."
}
