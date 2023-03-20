####################
#
# Harness Organization Outputs
#
####################

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
