output email {
  value       = join(",",googleworkspace_group.local[*].email)
  description = "Email address of the created GSuite Group"
}

output name {
  value       = join(",", googleworkspace_group.local[*].name)
  description = "Name of the created GSuite Group"
}
