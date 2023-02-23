# Variable Management
resource "harness_platform_variables" "var" {

  # [Required] (String) Unique identifier of the resource.
  identifier = local.fmt_identifier

  # [Required] (String) Name of the resource.
  name = var.name

  # [Optional] (String) Description of the resource.
  description = var.description

  # [Optional] (String) Unique identifier of the organization.
  org_id = var.organization_id

  # [Optional] (String) Unique identifier of the project.
  project_id = var.project_id

  # (String) Type of Variable
  type       = "String"

  spec {
    # (String) Type of Value of the Variable. For now only FIXED is supported
    value_type  = "FIXED"

    # (String) FixedValue of the variable
    fixed_value = var.value
  }
}



# When creating a new Variable, there is a potential race-condition
# as the variable comes up.  This resource will introduce
# a slight delay in further execution to wait for the resources to
# complete.
resource "time_sleep" "variable_setup" {
  depends_on = [
    harness_platform_variables.var
  ]

  create_duration  = "15s"
  destroy_duration = "15s"
}
