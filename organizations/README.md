# organizations

## Example

```hcl
module "harness-core" {

  source = "../../organizations"

  name        = var.organization_name
  description = "Harness Core Management Organization"
  tags = {
    purpose = "harness-management"
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
| [harness_platform_organization.organization](https://registry.terraform.io/providers/harness/harness/latest/docs/resources/platform_organization) | resource |
| [time_sleep.organization_setup](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | [Optional] Provide an organization description.  Must be six or more characters | `string` | `"Harness Organization created via Terraform"` | no |
| <a name="input_global_tags"></a> [global\_tags](#input\_global\_tags) | [Optional] Provide a Map of Tags to associate with all organizations and resources created | `map(any)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | [Required] Provide an organization name.  Must be two or more characters | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | [Optional] Provide a Map of Tags to associate with the organization | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_organization_details"></a> [organization\_details](#output\_organization\_details) | n/a |
