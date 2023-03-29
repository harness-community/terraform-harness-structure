####################
#
# Harness Organization Outputs
#
####################
# 2023-03-16
# This output is being deprecated and replaced by the output
# labeled `details`
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

output "details" {
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
