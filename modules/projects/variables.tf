####################
#
# Harness Project Variables
#
####################
variable "identifier" {
  type        = string
  description = "[Optional] Provide a custom identifier.  Must be at least 1 character but less than 128 characters and can only include alphanumeric or '_'"
  default     = null

  validation {
    condition = (
      var.identifier != null
      ?
      can(regex("^[0-9A-Za-z][0-9A-Za-z_]{0,127}$", var.identifier))
      :
      true
    )
    error_message = <<EOF
        Validation of an object failed.
            * [Optional] Provide a custom identifier.  Must be at least 1 character but less than 128 characters and can only include alphanumeric or '_'.
            Note: If not set, Terraform will auto-assign an identifier based on the name of the resource
        EOF
  }
}
variable "name" {
  type        = string
  description = "[Required] Provide an project name. Must be at least 1 character but but less than 128 characters"

  validation {
    condition = (
      length(var.name) > 1
    )
    error_message = <<EOF
        Validation of an object failed.
            * [Required] Provide an project name. Must be at least 1 character but but less than 128 characters.
        EOF
  }
}
variable "organization_id" {
  type        = string
  description = "[Required] Provide an organization reference ID.  Must exist before execution"

  validation {
    condition = (
      length(var.organization_id) > 2
    )
    error_message = <<EOF
        Validation of an object failed.
            * [Required] Provide an existing organization id.  Must exist before execution.
        EOF
  }
}

variable "color" {
  type        = string
  description = "[Optional] (String) Color of the project."
  default     = null

  validation {
    condition = (
      var.color != null
      ?
      can(regex("^#([A-Fa-f0-9]{6})", var.color))
      :
      true
    )
    error_message = <<EOF
        Validation of an object failed.
            * [Optional] Provide Project Color Identifier.  Must be a valid Hex Color code.
        EOF
  }
}

variable "description" {
  type        = string
  description = "[Optional] (String) Description of the resource."
  default     = "Harness Project created via Terraform"

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

variable "existing" {
  type        = bool
  description = "[Optional] Is this an existing project?"
  default     = false
}

variable "case_sensitive" {
  type        = bool
  description = "[Optional] Should identifiers be case sensitive by default? (Note: Setting this value to `true` will retain the case sensitivity of the identifier)"
  default     = false
}

variable "tags" {
  type        = map(any)
  description = "[Optional] Provide a Map of Tags to associate with the project"
  default     = {}

  validation {
    condition = (
      length(keys(var.tags)) == length(values(var.tags))
    )
    error_message = <<EOF
        Validation of an object failed.
            * [Optional] Provide a Map of Tags to associate with the project
        EOF
  }
}

variable "global_tags" {
  type        = map(any)
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
