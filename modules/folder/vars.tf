variable name {
  type        = string
  description = "Name of GCP Folder to create"
}

variable parent_id {
  type        = string
  description = "Parent ID in the folder of `folders/<folder_id>` or `organizations/<org_id>` in which to create the GCP Folder"
}

variable gsuite_group_email {
  type        = string
  description = "Email address of GSuite Group"
}

variable mock_gsuite_group_name {
  type        = string
  description = "Due limitations with Terraform Count and data resource lookups we must use a mock email address instead of an empty value."
}

variable folder_view_iam_role {
  type        = string
  description = "Basic IAM Role to be able to view folders"
}

variable iam_roles {
  type        = list(string)
  description = "The IAM Roles to grant the Group we bind to the GCP Folder"
}

variable domain {
  type        = string
  description = "Domain name of the Organization in which to create the Folder."
}
