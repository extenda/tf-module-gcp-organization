variable roles_map {
  description = "List of the roles in the external projects"
  type = list(object({
    project   = string
    iam_roles = list(string)
  }))
}

variable gsuite_group_name {
  type        = string
  description = "Email address of the GSuite Group"
}

variable domain {
  type        = string
  description = "Domain name of the Organization"
}
