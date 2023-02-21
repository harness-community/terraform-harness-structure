
# Organization Setup Details
variable "name" {
  type        = string
  description = "[Required] Provide an organization name.  Must be two or more characters"

  validation {
    condition = (
      length(var.name) > 2
    )
    error_message = <<EOF
        Validation of an object failed.
            * [Required] Provide an organization name.  Must be two or more characters.
        EOF
  }
}

variable "description" {
  type        = string
  description = "[Optional] Provide an organization description.  Must be six or more characters"
  default     = "Harness Organization created via Terraform"

  validation {
    condition = (
      length(var.description) > 6
    )
    error_message = <<EOF
        Validation of an object failed.
            * [Optional] Provide an organization description.  Must be six or more characters.
        EOF
  }
}

variable "tags" {
  type        = map(any)
  description = "[Optional] Provide a Map of Tags to associate with the organization"
  default     = {}

  validation {
    condition = (
      length(keys(var.tags)) == length(values(var.tags))
    )
    error_message = <<EOF
        Validation of an object failed.
            * [Optional] Provide a Map of Tags to associate with the organization
        EOF
  }
}


variable "global_tags" {
  type        = map(any)
  description = "[Optional] Provide a Map of Tags to associate with all organizations and resources created"
  default     = {}

  validation {
    condition = (
      length(keys(var.global_tags)) == length(values(var.global_tags))
    )
    error_message = <<EOF
        Validation of an object failed.
            * [Optional] Provide a Map of Tags to associate with all organizations and resources created
        EOF
  }
}
