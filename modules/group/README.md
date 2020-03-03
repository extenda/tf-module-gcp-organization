## Providers

| Name | Version |
|------|---------|
| gsuite | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| email | Email address of GSuite Group | `string` | n/a | yes |
| members | Users and Groups to add as GSuite Tribe or Clan Members | <pre>object({<br>    groups = list(object(<br>      {<br>        email = string<br>      }<br>    ))<br>    users = list(object(<br>      {<br>        name  = string<br>        email = string<br>      }<br>    ))<br>  })<br></pre> | n/a | yes |
| mock\_name | Mock name of GSuite Group | `string` | n/a | yes |
| name | Name of GSuite Group to create | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| email | Email address of the created GSuite Group |
| name | Name of the created GSuite Group |

