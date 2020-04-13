# tf-module-gcp-organization

<img src="https://cdn.rawgit.com/hashicorp/terraform-website/master/content/source/assets/images/logo-hashicorp.svg" height="100px">

## Purpose

An Extenda Retail maintained Terraform Module, which is intended to manage specific Organizational resources within the Google Cloud Platform and GSuite. Currently, this module is intended to create Folders within the GCP Organization. In addition, the module is designed to create a GSuite group (if not already existing) and to bind IAM Role(s) to the GCP Folder for the GSuite Group.

## Providers

| Name   | Version   |
|:-------|:----------|
| google | ~> 2.7    |
| gsuite | ~> 0.1.35 |

GSuite Provider must be manually downloaded and installed in `$HOME/.terraform.d/plugins`. See GSuite Provider GitHub Repo for [Installation instructions](https://github.com/DeviaVir/terraform-provider-gsuite#installation).

## Credentials

For Folder creation, you must be using a Service Account with a Role granted which allows Folder creation within the location specified by the `parent_id`. If no `parent_id` is specified, the Folder will be created in the root level of the Organization.

For GSuite Group creation you must use a Service Account which is granted GSuite Domain Wide Delegation to impersonate the account specified in the `impersonated_user_email` variable. See GSuite Provider GitHub Repo for [details](https://github.com/DeviaVir/terraform-provider-gsuite#using-a-service-account)

## Usage

```hcl
module organization {
  source = "github.com/extenda/tf-module-gcp-organization"

  folder_name       = "foo"
  domain            = "example.com"
  gsuite_group_name = "foo"
}
```
This will create a folder named `foo` at the root of the `example.com` GCP Org. In addition, a GSuite Group named `foo` with email `foo@example.com` will be created and bound to the Folder with IAM Role `roles/resourcemanager.folderViewer`.

```hcl
module organization {
  source = "github.com/extenda/tf-module-gcp-organization"

  folder_name       = "bar"
  folder_parent_id  = "folders/12345678"
  domain            = "example.com"
  gsuite_group_name = "foo-bar"
}
```
This will create a folder named `bar` within the Folder with Id `folders/12345678` GCP Org. In addition, a GSuite Group named `foo-bar` with email `foo-bar@example.com` will be created and bound to the Folder with IAM Role `roles/resourcemanager.folderViewer`.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| domain | Domain name of the Organization in which to create the Folder. | `string` | n/a | yes |
| folder\_iam\_role | List of IAM Roles to grant the Group we bind to the GCP Folder | `list(string)` | `[]` | no |
| folder\_view\_iam\_role | Basic IAM Role to able view folders | `string` | `"roles/resourcemanager.folderViewer"` | no |
| folder\_name | The name of the GCP Folder to create | `string` | n/a | yes |
| folder\_parent\_id | The ID of the Parent Folder in which to create the new Folder. If not provided, Folder will be created at the root of the Organization. | `string` | `""` | no |
| gsuite\_group\_members | Users and Groups to add as GSuite Tribe or Clan Members | <pre>object({<br>    groups = list(object(<br>      {<br>        email = string<br>      }<br>    ))<br>    users = list(object(<br>      {<br>        name  = string<br>        email = string<br>      }<br>    ))<br>  })<br></pre> | n/a | yes |
| gsuite\_group\_name | Name of GSuite Group. If none provided then no GSuite group will be created nor bound to the Folder. | `string` | `""` | no |
| impersonated\_user\_email | Email account of GSuite Admin user to impersonate for creating GSuite Groups. If not provided, will default to `terraform@<var.domain>` | `string` | `""` | no |
| mock\_gsuite\_group\_name | Due limitations with Terraform Count and data resource lookups we must use a mock email address instead of an empty value. | `string` | `"placeholder-123"` | no |

## Outputs

| Name | Description |
|------|-------------|
| folder\_id | Folder ID of the created GCP Folder |
| group\_email | Email address of the created GSuite Group |
| group\_name | Name of the created GSuite Group |
