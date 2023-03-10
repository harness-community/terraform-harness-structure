####################
#
# Harness Secret File Variables
#
####################
variable "identifier" {
  type        = string
  description = "[Required] Provide a secrets identifier.  More than 2 but less than 128 characters and can only include alphanumeric or '_'"
  default     = null

  validation {
    condition = (
      var.identifier != null
      ?
      can(regex("^[0-9A-Za-z][0-9A-Za-z_]{2,127}$", var.identifier))
      :
      true
    )
    error_message = <<EOF
        Validation of an object failed.
            * [Required] Provide a secrets identifier.  More than 2 but less than 128 characters and can only include alphanumeric or '_'.
        EOF
  }
}
variable "name" {
  type        = string
  description = "[Required] Provide a secrets name.  Must be two or more characters"

  validation {
    condition = (
      length(var.name) > 2
    )
    error_message = <<EOF
        Validation of an object failed.
            * [Required] Provide a secrets name.  Must be two or more characters.
        EOF
  }
}

variable "organization_id" {
  type        = string
  description = "[Optional] Provide an organization reference ID.  Must exist before execution"
  default     = null

  validation {
    condition = (
      anytrue([
        can(regex("^([a-zA-Z0-9_]*)", var.organization_id)),
        var.organization_id == null
      ])
    )
    error_message = <<EOF
        Validation of an object failed.
            * [Optional] Provide an organization name.  Must exist before execution.
        EOF
  }
}

variable "project_id" {
  type        = string
  description = "[Optional] Provide an project reference ID.  Must exist before execution"
  default     = null

  validation {
    condition = (
      anytrue([
        can(regex("^([a-zA-Z0-9_]*)", var.project_id)),
        var.project_id == null
      ])
    )
    error_message = <<EOF
        Validation of an object failed.
            * [Optional] Provide an project name.  Must exist before execution.
        EOF
  }
}

variable "description" {
  type        = string
  description = "[Optional] (String) Description of the resource."
  default     = "Harness Secret created via Terraform"

  validation {
    condition = (
      length(var.description) > 6
    )
    error_message = <<EOF
        Validation of an object failed.
            * [Optional] Provide an Project description.  Must be six or more characters.
        EOF
  }
}

variable "secret_manager" {
  type        = string
  description = "[Required] (String) Identifier of the Secret Manager used to manage the secret."
  default     = "harnessSecretManager"

  validation {
    condition = (
      anytrue([
        can(regex("^([a-zA-Z0-9.]*)", var.secret_manager)),
        var.secret_manager != null
      ])
    )
    error_message = <<EOF
        Validation of an object failed.
            * [Required] (String) Identifier of the Secret Manager used to manage the secret.
        EOF
  }
}

variable "file_path" {
  type        = string
  description = "[Required] (String) Path of the file containing secret value"
}

variable "tags" {
  type        = map(string)
  description = "[Optional] Provide a Map of Tags to associate with the secret"
  default     = {}

  validation {
    condition = (
      length(keys(var.tags)) == length(values(var.tags))
    )
    error_message = <<EOF
        Validation of an object failed.
            * [Optional] Provide a Map of Tags to associate with the secret
        EOF
  }
}

variable "global_tags" {
  type        = map(string)
  description = "[Optional] Provide a Map of Tags to associate with the project and resources created"
  default     = {}

  validation {
    condition = (
      length(keys(var.global_tags)) == length(values(var.global_tags))
    )
    error_message = <<EOF
        Validation of an object failed.
            * [Optional] Provide a Map of Tags to associate with the project and resources created
        EOF
  }
}
