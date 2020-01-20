## Providers

| Name | Version |
|------|---------|
| google | ~> 2.7 |
| gsuite | ~> 0.1.35 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| domain | Domain name of the Organization in which to create the Folder. | `string` | n/a | yes |
| gsuite\_group\_email | Email address of GSuite Group | `string` | n/a | yes |
| gsuite\_group\_name | Name of GSuite Group | `string` | n/a | yes |
| iam\_role | The IAM Role to grant the Group we bind to the GCP Folder | `string` | n/a | yes |
| name | Name of GCP Folder to create | `string` | n/a | yes |
| parent\_id | Parent ID in the folder of `folders/<folder_id>` or `organizations/<org_id>` in which to create the GCP Folder | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| folder\_id | Folder ID of the created GCP Folder |
| group\_email | Email address of the created GSuite Group |
| group\_name | Name of the created GSuite Group |

