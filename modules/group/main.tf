data "gsuite_group" "local" {
  email  = var.email
}

resource "gsuite_group" "local" {
  count = var.name != var.mock_name && (data.gsuite_group.local.name == null || data.gsuite_group.local.description == "Created by Terraform") ? 1 : 0

  email       = var.email
  name        = var.name
  description = "Created by Terraform"
}
