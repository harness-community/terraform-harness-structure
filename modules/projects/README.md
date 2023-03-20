# Terraform Modules for Harness Projects
Terraform Module for creating and managing Harness Projects

## Summary
This module handle the creation and managment of projects by leveraging the Harness Terraform provider

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
    random = {
      source = "hashicorp/random"
    }
  }
}
```

## Variables

_Note: When the identifier variable is not provided, the module will automatically format the identifier based on the provided resource name_

| Name | Description | Type | Default Value | Mandatory |
| --- | --- | --- | --- | --- |
| name | [Required] Provide an organization name.  Must be two or more characters | string | | X |
| organization_id | [Required] Provide an organization reference ID.  Must exist before execution | string | | X |
| identifier | [Optional] Provide a custom identifier.  More than 2 but less than 128 characters and can only include alphanumeric or '_' | string | null | |
| description | [Optional] Provide an organization description.  Must be six or more characters | string | "Harness Organization created via Terraform" | |
| color | [Optional] (String) Color of the project. | string | null | |
| tags | [Optional] Provide a Map of Tags to associate with the organization | map(any) | {} | |
| global_tags | [Optional] Provide a Map of Tags to associate with all organizations and resources created | map(any) | {} | |

## Outputs
| Name | Description | Value |
| --- | --- | --- |
| details | Details for the created Harness project | Map containing details of created project
| project_details | [Deprecated] Details for the created Harness project | Map containing details of created project

## Examples
### Build a Single Project with minimal inputs
```
module "project" {
  source = "git@github.com:harness-community/terraform-harness-structure.git//modules/projects"

  name            = "project1"
  organization_id = "myorg"
}
```

### Build multiple projects
```
variable "project_list" {
    type = list(map())
    default = [
        {
            name = "alpha"
            description = "Project for alpha"
            tags = {
                purpose = "alpha"
            }
        },
        {
            name = "bravo"
            description = "Project for bravo"
            tags = {
                purpose = "bravo"
            }
        },
        {
            name = "charlie"
            description = "Project for charlie"
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

module "projects" {
  source = "git@github.com:harness-community/terraform-harness-structure.git//modules/projects"
  for_each = { for project in var.project_list : project.name => project }

  name            = each.value.name
  description     = each.value.description
  organization_id = "myorg"
  tags            = each.value.tags
  global_tags     = var.global_tags
}
```

## Contributing
A complete [Contributors Guide](../CONTRIBUTING.md) can be found in this repository

## Authors
Module is maintained by Harness, Inc

## License

MIT License. See [LICENSE](../LICENSE) for full details.
