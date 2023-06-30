# Terraform Modules for Harness Projects
Terraform Module for creating and managing Harness Projects

## Summary
This module handle the creation and managment of projects by leveraging the Harness Terraform provider

## Supported Terraform Versions
_Note: These modules require a minimum of Terraform Version 1.2.0 to support the Input Validations and Precondition Lifecycle hooks leveraged in the code._

_Note: The list of supported Terraform Versions is based on the most recent of each release which has been tested against this module._

    - v1.2.9
    - v1.3.9
    - v1.4.6
    - v1.5.0
    - v1.5.1
    - v1.5.2

_Note: Terraform version 1.4.1 will not work due to an issue with the Random provider_

## Providers
This module requires that the calling template has defined the [Harness Provider - Docs](https://registry.terraform.io/providers/harness/harness/latest/docs) authentication.

### Example setup of the Harness Provider Authentication with environment variables
You can also set up authentication with Harness through environment variables. To do this set the following items in your environment:
- HARNESS_ENDPOINT: Harness Platform URL, defaults to Harness SaaS URL: https://app.harness.io/gateway
- HARNESS_ACCOUNT_ID: Harness Platform Account Number
- HARNESS_PLATFORM_API_KEY: Harness Platform API Key for your account

### Example setup of the Harness Provider
```
# Provider Setup Details
variable "harness_platform_url" {
  type        = string
  description = "[Optional] Enter the Harness Platform URL.  Defaults to Harness SaaS URL"
  default     = null # If Not passed, then the ENV HARNESS_ENDPOINT will be used or the default value of "https://app.harness.io/gateway"
}

variable "harness_platform_account" {
  type        = string
  description = "[Required] Enter the Harness Platform Account Number"
  default     = null # If Not passed, then the ENV HARNESS_ACCOUNT_ID will be used
  sensitive   = true
}

variable "harness_platform_key" {
  type        = string
  description = "[Required] Enter the Harness Platform API Key for your account"
  default     = null # If Not passed, then the ENV HARNESS_PLATFORM_API_KEY will be used
  sensitive   = true
}

provider "harness" {
  endpoint         = var.harness_platform_url
  account_id       = var.harness_platform_account
  platform_api_key = var.harness_platform_key
}

```

### Terraform required providers declaration
```
terraform {
  required_providers {
    harness = {
      source  = "harness/harness"
      version = ">= 0.14"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.9.1"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 3.4.3"
    }
  }
}
```

## Variables

_Note: When the identifier variable is not provided, the module will automatically format the identifier based on the provided resource name_

| Name | Description | Type | Default Value | Mandatory |
| --- | --- | --- | --- | --- |
| name | [Required] Provide an organization name. Must be at least 1 character but but less than 128 characters | string | | X |
| organization_id | [Required] Provide an organization reference ID.  Must exist before execution | string | | X |
| identifier | [Optional] Provide a custom identifier.  Must be at least 1 character but less than 128 characters and can only include alphanumeric or '_' | string | null | |
| description | [Optional] Provide an organization description.  Must be six or more characters | string | "Harness Organization created via Terraform" | |
| color | [Optional] (String) Color of the project. | string | null | |
| existing | [Optional] Is this an existing organization? | bool | false | |
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
A complete [Contributors Guide](../../CONTRIBUTING.md) can be found in this repository

## Authors
Module is maintained by Harness, Inc

## License

MIT License. See [LICENSE](../../LICENSE) for full details.
