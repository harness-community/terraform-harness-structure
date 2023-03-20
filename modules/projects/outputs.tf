####################
#
# Harness Project Outputs
#
####################
# 2023-03-16
# This output is being deprecated and replaced by the output
# labeled `details`
output "project_details" {
  depends_on = [
    time_sleep.project_setup
  ]
  value       = harness_platform_project.project
  description = "Details for the created Harness Project"
}

output "details" {
  depends_on = [
    time_sleep.project_setup
  ]
  value       = harness_platform_project.project
  description = "Details for the created Harness Project"
}
