####################
#
# Harness Project Setup
#
####################

# Allows for automatic color selection for projects when
# var.color is not provided.
resource "random_id" "color_picker" {
  count = var.existing ? 0 : 1
  keepers = {
    # Generate a new id each time we switch to a new resource id
    identifier = local.fmt_identifier
  }

  byte_length = 3
}

resource "harness_platform_project" "project" {
  count = var.existing ? 0 : 1
  # [Required] (String) Unique identifier of the resource.
  identifier = local.fmt_identifier
  # [Required] (String) Name of the resource.
  name = var.name
  # [Required] (String) Unique identifier of the organization.
  org_id = var.organization_id

  # [Optional] (String) Color of the project.
  color = var.color != null ? var.color : "#${random_id.color_picker[0].hex}"
  # [Optional] (String) Description of the resource.
  description = var.description
  # [Optional] (Set of String) Tags to associate with the resource.
  tags = local.common_tags
}

data "harness_platform_project" "selected" {
  count  = var.existing ? 1 : 0
  name   = var.name
  org_id = var.organization_id
}

# When creating a new Project, there is a potential race-condition
# as the project comes up.  This resource will introduce
# a slight delay in further execution to wait for the resources to
# complete.
resource "time_sleep" "project_setup" {
  count = var.existing ? 0 : 1
  depends_on = [
    harness_platform_project.project
  ]

  create_duration = "15s"
}
