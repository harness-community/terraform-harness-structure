# projects

## Example

```hcl
module "project-harness-management" {
  source = "../../projects"

  name            = "harness-management"
  organization_id = module.harness-core.organization_details.id
  color           = "#83A38C"
  description     = "Project to support Harness Management Pipelines"
  tags = {
    role = "platform-management"
  }
  global_tags = var.global_tags
}

module "project-harness-organization-management" {
  source = "../../projects"

  name            = "harness-organization-management"
  organization_id = module.harness-core.organization_details.id
  color           = "#4287F5"
  description     = "Project to support Harness Organization Management Pipelines"
  tags = {
    role = "organization-management"
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
| [harness_platform_project.project](https://registry.terraform.io/providers/harness/harness/latest/docs/resources/platform_project) | resource |
| [time_sleep.project_setup](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_color"></a> [color](#input\_color) | [Optional] (String) Color of the project. | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | [Optional] (String) Description of the resource. | `string` | `"Harness Project created via Terraform"` | no |
| <a name="input_global_tags"></a> [global\_tags](#input\_global\_tags) | [Optional] Provide a Map of Tags to associate with the project and resources created | `map(any)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | [Required] Provide a project name.  Must be two or more characters | `string` | n/a | yes |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | [Required] Provide an organization reference ID.  Must exist before execution | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | [Optional] Provide a Map of Tags to associate with the project | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_details"></a> [project\_details](#output\_project\_details) | n/a |