## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| domain | Domain name of the Organization in which to create the Folder. | `string` | n/a | yes |
| gsuite\_group\_email | Email address of GSuite Group | `string` | n/a | yes |
| iam\_role | The IAM Role to grant the Group we bind to the GCP Folder | `string` | n/a | yes |
| mock\_gsuite\_group\_name | Due limitations with Terraform Count and data resource lookups we must use a mock email address instead of an empty value. | `string` | n/a | yes |
| name | Name of GCP Folder to create | `string` | n/a | yes |
| parent\_id | Parent ID in the folder of `folders/<folder_id>` or `organizations/<org_id>` in which to create the GCP Folder | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | Folder ID of the created GCP Folder |

