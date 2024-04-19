variable name {
  type        = string
  description = "Name of GSuite Group to create"
}

variable email {
  type        = string
  description = "Email address of GSuite Group"
}

variable members {
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
  description = "Users and Groups to add as GSuite Tribe or Clan Members"
}

variable group_aliases {
  type        = list(string)
  description = "A list of aliases for the group"
}

variable create_group {
  type        = bool
  description = "Whether to create a GSuite group or not"
}

variable manage_members {
  type        = bool
  default     = true
  description = "Whether to manage members here or not"
}
