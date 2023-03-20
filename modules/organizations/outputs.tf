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
  value       = harness_platform_organization.organization
  description = "Details for the created Harness Organization"
}

output "details" {
  depends_on = [
    time_sleep.organization_setup
  ]
  value       = harness_platform_organization.organization
  description = "Details for the created Harness Organization"
}
