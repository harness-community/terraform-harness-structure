####################
#
# Harness Structure Default Variables
#
####################
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

variable "organization_name" {
  type        = string
  description = "Provide an organization name.  Must exist before execution"
  default     = "default"

  validation {
    condition = (
      var.organization_name != null
      ?
      length(var.organization_name) > 2
      :
      true
    )
    error_message = <<EOF
        Validation of an object failed.
            * Provide an organization name.  Must exist before execution.
        EOF
  }
}

variable "project_name" {
  type        = string
  description = "Provide an project name in the chosen organization.  Must exist before execution"
  default     = "Default Project"

  validation {
    condition = (
      var.project_name != null
      ?
      can(regex("^([a-zA-Z0-9_]*)", var.project_name))
      :
      true
    )
    error_message = <<EOF
        Validation of an object failed.
            * Provide an project name.  Must exist before execution.
        EOF
  }
}
