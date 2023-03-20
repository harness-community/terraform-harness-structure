# Terraform Modules for Harness Secrets - File
Terraform Module for creating and managing Harness File Secrets

## Summary
This module handle the creation and managment of File Secrets by leveraging the Harness Terraform provider

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
