# Terraform Modules for Harness Variables
Terraform Module for creating and managing Harness Platform Variables

## Summary
This module handle the creation and managment of Platform Variables by leveraging the Harness Terraform provider

## Providers

```
terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
    time = {
      source = "hashicorp/time"
    }
  }
}
```

## Variables

_Note: When the identifier variable is not provided, the module will automatically format the identifier based on the provided resource name_

| Name | Description | Type | Default Value | Mandatory |
| --- | --- | --- | --- | --- |
| name | [Required] Provide a secrets name.  Must be two or more characters | string | | X |
| value | [Required] Value of the Variable | string | | X |
| identifier | [Optional] Provide a secrets identifier.  More than 2 but less than 128 characters and can only include alphanumeric or '_' | string | null | |
| organization_id | [Optional] Provide an organization reference ID.  Must exist before execution | string | null | |
| project_id | [Optional] Provide an project reference ID.  Must exist before execution | string | null | |
| description | [Optional] (String) Description of the resource. | string | Harness Secret created via Terraform | |
| tags | [Optional] Provide a Map of Tags to associate with the secret | map(string) | {} | |
| global_tag | [Optional] Provide a Map of Tags to associate with the project and resources created | map(string) | {} | |

## Outputs
| Name | Description | Value |
| --- | --- | --- |
| details | Details for the created Harness variable | Map containing details of created variable
| variable_details | [Deprecated] Details for the created Harness variable | Map containing details of created variable

## Examples
### Add text as a variable within the Account
```
module "harness_variables" {
  source = "git@github.com:harness-community/terraform-harness-structure.git//modules/variables"

  name        = "test_var"
  value       = "myvalue"
}
```

### Add text as a variable within the Project
```
module "harness_variables" {
  source = "git@github.com:harness-community/terraform-harness-structure.git//modules/variables"

  name            = "test_var"
  organization_id = "myorg"
  project_id      = "myproject"
  value           = "myvalue"
}
```


### Add multiple variables in a project
```
variable "harness_variables" {
    type = list(map)
    default = [
        {
            name = "test1"
            value = "value1"
        },
        {
            name = "test2"
            value = "value2"
        },
        {
            name = "test3"
            value = "value3"
        }
    ]
}

variable "global_tags" {
    type = map(string)
    default = {
        environment = "NonProd"
    }
}

module "harness_variables" {
  source = "git@github.com:harness-community/terraform-harness-structure.git//modules/variables"
  for_each = { for harness_variable in var.harness_variables : harness_variable.name => harness_variable}

  name            = each.value.name
  description     = "My Var - ${each.value.name}"
  organization_id = "myorg"
  project_id      = "myproject"
  value           = each.value.value
  global_tags     = var.global_tags
}

```

## Contributing
A complete [Contributors Guide](../CONTRIBUTING.md) can be found in this repository

## Authors
Module is maintained by Harness, Inc

## License

MIT License. See [LICENSE](../LICENSE) for full details.
