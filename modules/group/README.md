## Providers

| Name | Version |
|------|---------|
| googleworkspace | ~> 0.7.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| create\_group | Whether to create a GSuite group or not | `bool` | n/a | yes |
| email | Email address of GSuite Group | `string` | n/a | yes |
| group\_aliases | A list of aliases for the group | list(string) | n/a | yes |
| members | Users and Groups to add as GSuite Tribe or Clan Members | <pre>object({<br>    groups = list(object(<br>      {<br>        email = string<br>      }<br>    ))<br>    users = list(object(<br>      {<br>        name  = string<br>        email = string<br>      }<br>    ))<br>  })<br></pre> | n/a | yes |

| name | Name of GSuite Group to create | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| email | Email address of the created GSuite Group |
| name | Name of the created GSuite Group |

