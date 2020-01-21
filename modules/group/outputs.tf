output email {
  value       = join(",",gsuite_group.local[*].email)
  description = "Email address of the created GSuite Group"
}

output name {
  value       = join(",", gsuite_group.local[*].name)
  description = "Name of the created GSuite Group"
}
