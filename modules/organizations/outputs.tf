####################
#
# Harness Organization Outputs
#
####################

output "organization_details" {
  depends_on = [
    time_sleep.organization_setup
  ]
  value = (
    var.existing
    ?
    data.harness_platform_organization.selected[0]
    :
    harness_platform_organization.organization[0]
  )
  description = "Details for the created Harness Organization"
}
