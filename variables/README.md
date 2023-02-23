# secrets

## Example

```hcl
module "secrets-azure-container-services" {
  source = "../../secrets"

  name            = "Azure Container Registry Client Secret"
  description     = "Azure Container Registry Client ID"
  organization_id = module.harness-core.organization_details.id
  secret_manager  = "harnessSecretManager"
  type            = "text"
  value_type      = "Inline"
  value           = var.azure_container_registry_client_secret
  tags = {
    purpose = "azure-container-registry"
  }
  global_tags = var.global_tags
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_harness"></a> [harness](#provider\_harness) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [harness_platform_secret_text.text](https://registry.terraform.io/providers/harness/harness/latest/docs/resources/platform_secret_text) | resource |
| [time_sleep.secret_setup](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | [Optional] (String) Description of the resource. | `string` | `"Harness Secret created via Terraform"` | no |
| <a name="input_global_tags"></a> [global\_tags](#input\_global\_tags) | [Optional] Provide a Map of Tags to associate with the secret and resources created | `map(any)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | [Required] Provide a secrets name.  Must be two or more characters | `string` | n/a | yes |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | [Required] Provide an organization reference ID.  Must exist before execution | `string` | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | [Required] Provide an project reference ID.  Must exist before execution | `string` | `null` | no |
| <a name="input_secret_manager"></a> [secret\_manager](#input\_secret\_manager) | [Required] (String) Identifier of the Secret Manager used to manage the secret. | `string` | `"harnessSecretManager"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | [Optional] Provide a Map of Tags to associate with the secret | `map(any)` | `{}` | no |
| <a name="input_type"></a> [type](#input\_type) | [Required] (String) Secret Type - One of 'file', 'text', 'sshkey' | `string` | n/a | yes |
| <a name="input_value"></a> [value](#input\_value) | [Optional] (String, Sensitive) Value of the Secret | `string` | `null` | no |
| <a name="input_value_type"></a> [value\_type](#input\_value\_type) | [Required] (String) This has details to specify if the secret value is Inline or Reference. | `string` | `"Inline"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret_details"></a> [secret\_details](#output\_secret\_details) | n/a |
| <a name="output_success"></a> [success](#output\_success) | n/a |
