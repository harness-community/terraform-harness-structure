####################
#
# Harness Organization Setup
#
####################
resource "harness_platform_organization" "organization" {
  count = var.existing ? 0 : 1
  # [Required] (String) Unique identifier of the resource.
  identifier = local.fmt_identifier
  # [Required] (String) Name of the resource.
  name = var.name

  # (String) Description of the resource.
  description = var.description
  # (Set of String) Tags to associate with the resource.
  tags = local.common_tags

}

data "harness_platform_organization" "selected" {
  count = var.existing ? 1 : 0
  # [Required] (String) Unique identifier of the resource.
  identifier = local.fmt_identifier
}

# When creating a new Organization, there is a potential
# race-condition as the organization comes up.  This
# resource will introduce a slight delay in further
# execution to wait for the resources to complete.
resource "time_sleep" "organization_setup" {
  count = var.existing ? 0 : 1
  depends_on = [
    harness_platform_organization.organization,
    data.harness_platform_organization.selected
  ]

  create_duration = "15s"
}
