# Variable Management for Harness Projects
variable "name" {
  type        = string
  description = "[Required] Provide a project name.  Must be two or more characters"

  validation {
    condition = (
      length(var.name) > 2
    )
    error_message = <<EOF
        Validation of an object failed.
            * [Required] Provide a project name.  Must be two or more characters.
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
            * [Required] Provide an organization name.  Must exist before execution.
        EOF
  }
}

variable "color" {
  type        = string
  description = "[Optional] (String) Color of the project."
  default     = null

  validation {
    condition = (
      anytrue([
        can(regex("^#([A-Fa-f0-9]{6})", var.color)),
        var.color == null
      ])
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
