variable folder_name {
  type        = string
  description = "The name of the GCP Folder to create"
}

variable folder_parent_id {
  type        = string
  default     = ""
  description = "The ID of the Parent Folder in which to create the new Folder. If not provided, Folder will be created at the root of the Organization."
}

variable folder_view_iam_role {
  type        = string
  default     = "roles/resourcemanager.folderViewer"
  description = "Basic IAM Role to be able to view folders"
}

variable folder_iam_roles {
  type        = list(string)
  default     = []
  description = "List of IAM Roles to grant the Group we bind to the GCP Folder"
}

variable folder_additional_iam_member_bindings {
  type        = map(list(string))
  default     = {}
  description = "Additional IAM Members who will be granted one or more Roles to the Folder. See examples for expected variable structure."
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

variable gsuite_group_members {
  type = object({
    groups = list(object(
      {
        email = string
      }
    ))
    users = list(object(
      {
        name  = string
        email = string
      }
    ))
  })
  default = {
    groups = [],
    users  = []
  }
  description = "Users and Groups to add as GSuite Tribe or Clan Members"
}

variable roles_map {
  description = "List of the roles in the external projects"
  type = list(object({
    project   = string
    iam_roles = list(string)
  }))
  default = []
}

variable group_aliases {
  type        = list(string)
  default     = []
  description = "A list of aliases for the group"
}

variable customer_id {
  type        = string
  description = "The customer id provided with your Google Workspace subscription. It is found in the admin console under Account Settings."
}

variable create_group {
  type        = bool
  description = "Whether to create a GSuite group or not"
  default     = true
}
