module organization {
  source = "../"

  folder_name       = "foo"
  domain            = "extenda.io"
  gsuite_group_name = "foo"

  gsuite_group_members = {
    groups = [
      {
        email = "foo.group@extenda.io"
      },
      {
        email = "bar.group@extenda.io"
      }
    ]
    users  = [
      {
        name  = "Some User"
        email = "some.user@extenda.io"
      },
      {
        name  = "Another User"
        email = "another.user@extenda.io"
      }
    ]
  }

  folder_additional_iam_member_bindings = {
    "serviceAccount:my-service-account@my-project.iam.gserviceaccount.com" = [
      "roles/compute.networkAdmin",
      "roles/compute.xpnAdmin",
      "roles/container.admin"
    ]
    "group:gcp-something@extendaretail.com" = [
      "roles/resourceManager.folderAdmin",
      "roles/container.admin"
    ]
  }
}
