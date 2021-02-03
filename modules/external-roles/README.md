This module is intended to create IAM roles in the specific projects for the existing GSuite group.

The module accepts a list of projects and roles that will be added to thr GSuite group. The following data structure is passed to roles_map variable:

```
  roles_map = [
    {
      project = "project_id"
      iam_roles = [
        "roles/role1",
        "roles/role2"
      ]
    }
  ]
```

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| domain | Domain name of the Organization | `string` | n/a | yes |
| gsuite\_group\_name | Email address of the GSuite Group | `string` | n/a | yes |
| roles\_map | List of the roles in the external projects | <pre>list(object({<br>    project      = string<br>    iam_roles = list(string)<br>  }))<br></pre> | n/a | yes |

## Outputs

No output.
