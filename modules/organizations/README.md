# Terraform Modules for Harness Organizations
Terraform Module for creating and managing Harness Organizations

## Summary
This module handle the creation and managment of organizations by leveraging the Harness Terraform provider

## Supported Terraform Versions
    - v1.3.7
    - v1.3.8
    - v1.3.9
    - v1.4.0

## Providers

```
terraform {
  required_providers {
    harness = {
      source  = "harness/harness"
      version = "~> 0.14.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.9.1"
    }
  }
}
```

## Variables

_Note: When the identifier variable is not provided, the module will automatically format the identifier based on the provided resource name_

| Name | Description | Type | Default Value | Mandatory |
| --- | --- | --- | --- | --- |
| name | [Required] Provide an organization name.  Must be two or more characters | string | | X |
| identifier | [Optional] Provide a custom identifier.  More than 2 but less than 128 characters and can only include alphanumeric or '_' | string | null | |
| description | [Optional] Provide an organization description.  Must be six or more characters | string | "Harness Organization created via Terraform" | |
| existing | [Optional] Is this an existing organization? | bool | false | |
| tags | [Optional] Provide a Map of Tags to associate with the organization | map(any) | {} | |
| global_tags | [Optional] Provide a Map of Tags to associate with all organizations and resources created | map(any) | {} | |

## Examples
### Build a Single Organization with minimal inputs
```
module "organization" {
  source = "git@github.com:harness-community/terraform-harness-structure.git//modules/organizations"

  name        = "myorg"
}
```

### Build multiple organizations
```
variable "organization_list" {
    type = list(map())
    default = [
        {
            name = "alpha"
            description = "Organization for alpha"
            tags = {
                purpose = "alpha"
            }
        },
        {
            name = "bravo"
            description = "Organization for bravo"
            tags = {
                purpose = "bravo"
            }
        },
        {
            name = "charlie"
            description = "Organization for charlie"
            tags = {
                purpose = "charlie"
            }
        }
    ]
}

variable "global_tags" {
    type = map()
    default = {
        environment = "NonProd"
    }
}

module "organizations" {
  source = "git@github.com:harness-community/terraform-harness-structure.git//modules/organizations"
  for_each = { for org in var.organization_list : org.name => org }

  name        = each.value.name
  description = each.value.description
  tags        = each.value.tags
  global_tags = var.global_tags
}
```

## Contributing
A complete [Contributors Guide](../CONTRIBUTING.md) can be found in this repository

## Authors
Module is maintained by Harness, Inc

## License

MIT License. See [LICENSE](../LICENSE) for full details.
