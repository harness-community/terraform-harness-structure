# Terraform Modules for Harness Secrets - Text
Terraform Module for creating and managing Harness Text Secrets

## Summary
This module handle the creation and managment of Text Secrets by leveraging the Harness Terraform provider

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
| secret_manager | [Required] (String) Identifier of the Secret Manager used to manage the secret. | string | harnessSecretManager | X |
| identifier | [Optional] Provide a secrets identifier.  More than 2 but less than 128 characters and can only include alphanumeric or '_' | string | null | |
| organization_id | [Optional] Provide an organization reference ID.  Must exist before execution | string | null | |
| project_id | [Optional] Provide an project reference ID.  Must exist before execution | string | null | |
| description | [Optional] (String) Description of the resource. | string | Harness Secret created via Terraform | |
| value_type | [Optional] (String) This has details to specify if the secret value is Inline or Reference. | string | Inline | |
| value | [Optional] (String, Sensitive) Value of the Secret | string | null | |
| tags | [Optional] Provide a Map of Tags to associate with the secret | map(string) | {} | |
| global_tag | [Optional] Provide a Map of Tags to associate with the project and resources created | map(string) | {} | |

## Outputs
| Name | Description | Value |
| --- | --- | --- |
| details | Details for the created Harness secret | Map containing details of created secret
| secret_details | [Deprecated] Details for the created Harness secret | Map containing details of created secret

## Examples
### Add text as a secret within the Account
```
module "secret" {
  source = "git@github.com:harness-community/terraform-harness-structure.git//modules/secrets/file"

  name        = "test_secret"
  value       = "mysecret"
}
```

### Add text as a secret within the Project
```
module "secret" {
  source = "git@github.com:harness-community/terraform-harness-structure.git//modules/secrets/file"

  name            = "test_secret"
  organization_id = "myorg"
  project_id      = "myproject"
  value           = "mysecret"
}
```


### Add multiple secrets in a project
```
variable "secrets" {
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

module "secrets" {
  source = "git@github.com:harness-community/terraform-harness-structure.git//modules/secrets/text"
  for_each = { for secret in var.secrets : secret.name => secret}

  name            = each.value.name
  description     = "Text Secret - ${each.value.name}"
  organization_id = "myorg"
  project_id      = "myproject"
  secret_manager  = "harnessSecretManager"
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
