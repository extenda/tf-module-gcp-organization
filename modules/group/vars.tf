variable name {
  type = string
  description = "Name of GSuite Group to create"
}

variable mock_name {
  type = string
  description = "Mock name of GSuite Group"
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
