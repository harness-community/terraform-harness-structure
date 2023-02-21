resource "random_id" "color_picker" {
  keepers = {
    # Generate a new id each time we switch to a new AMI id
    identifier = local.fmt_identifier
  }

  byte_length = 3
}

resource "harness_platform_project" "project" {
  # [Required] (String) Unique identifier of the resource.
  identifier = local.fmt_identifier
  # [Required] (String) Name of the resource.
  name = var.name
  # [Required] (String) Unique identifier of the organization.
  org_id = var.organization_id

  # [Optional] (String) Color of the project.
  color = var.color != null ? var.color : "#${random_id.color_picker.hex}"
  # [Optional] (String) Description of the resource.
  description = var.description
  # [Optional] (Set of String) Tags to associate with the resource.
  tags = local.common_tags
}


# When creating a new Project, there is a potential race-condition
# as the project comes up.  This resource will introduce
# a slight delay in further execution to wait for the resources to
# complete.
resource "time_sleep" "project_setup" {
  depends_on = [
    harness_platform_project.project
  ]

  create_duration = "15s"
}
