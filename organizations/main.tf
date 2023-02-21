resource "harness_platform_organization" "organization" {
  # [Required] (String) Unique identifier of the resource.
  identifier = (
    lower(
      replace(
        replace(
          var.name,
          " ",
          "_"
        ),
        "-",
        "_"
      )
    )
  )
  # [Required] (String) Name of the resource.
  name = var.name

  # (String) Description of the resource.
  description = var.description
  # (Set of String) Tags to associate with the resource.
  tags = local.common_tags

}


# When creating a new Organization, there is a potential
# race-condition as the organization comes up.  This
# resource will introduce a slight delay in further
# execution to wait for the resources to complete.
resource "time_sleep" "organization_setup" {
  depends_on = [
    harness_platform_organization.organization
  ]

  create_duration = "15s"
}
