# Terraform Modules for Harness Secrets - File
Terraform Module for creating and managing Harness File Secrets

## Summary
This module handle the creation and managment of File Secrets by leveraging the Harness Terraform provider

## Supported Terraform Versions
_Note: These modules require a minimum of Terraform Version 1.2.0 to support the Input Validations and Precondition Lifecycle hooks leveraged in the code._

_Note: The list of supported Terraform Versions is based on the most recent of each release which has been tested against this module._

    - v1.2.9
    - v1.3.9
    - v1.4.0
    - v1.4.2
    - v1.4.3
    - v1.4.4

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
  }
}
```

## Variables

_Note: When the identifier variable is not provided, the module will automatically format the identifier based on the provided resource name_

| Name | Description | Type | Default Value | Mandatory |
| --- | --- | --- | --- | --- |
| name | [Required] Provide a secrets name.  Must be two or more characters | string | | X |
| secret_manager | [Required] (String) Identifier of the Secret Manager used to manage the secret. | string | harnessSecretManager | X |
| file_path | [Required] (String) Path of the file containing secret value | string | | X |
| identifier | [Optional] Provide a secrets identifier.  More than 2 but less than 128 characters and can only include alphanumeric or '_' | string | null | |
| organization_id | [Optional] Provide an organization reference ID.  Must exist before execution | string | null | |
| project_id | [Optional] Provide an project reference ID.  Must exist before execution | string | null | |
| description | [Optional] (String) Description of the resource. | string | Harness Secret created via Terraform | |
| tags | [Optional] Provide a Map of Tags to associate with the secret | map(string) | {} | |
| global_tag | [Optional] Provide a Map of Tags to associate with the project and resources created | map(string) | {} | |

## Outputs
| Name | Description | Value |
| --- | --- | --- |
| details | Details for the created Harness secret | Map containing details of created secret
| secret_details | [Deprecated] Details for the created Harness secret | Map containing details of created secret

## Examples
### Add a single file as a secret within the Account
```
module "secret" {
  source = "git@github.com:harness-community/terraform-harness-structure.git//modules/secrets/file"

  name        = "test_file"
  file_path   = "file.yml"
}
```

### Add a single file as a secret within the Project
```
module "secret" {
  source = "git@github.com:harness-community/terraform-harness-structure.git//modules/secrets/file"

  name            = "test_file"
  organization_id = "myorg"
  project_id      = "myproject"
  file_path       = "file.yml"
}
```


### Add multiple file secrets in a project
```
variable "secret_files" {
    type = list(string)
    default = [
        "defaults.yml",
        "scripts/script.sh"
    ]
}

variable "global_tags" {
    type = map(string)
    default = {
        environment = "NonProd"
    }
}

module "secrets" {
  source = "git@github.com:harness-community/terraform-harness-structure.git//modules/secrets/file"
  for_each = { for secret in var.secret_files : basename(secret) => secret}

  name            = each.key
  description     = "File contents - ${each.key}"
  organization_id = "myorg"
  project_id      = "myproject"
  secret_manager  = "harnessSecretManager"
  file_path       = each.value
  global_tags     = var.global_tags
}

```

## Contributing
A complete [Contributors Guide](../CONTRIBUTING.md) can be found in this repository

## Authors
Module is maintained by Harness, Inc

## License

MIT License. See [LICENSE](../LICENSE) for full details.
