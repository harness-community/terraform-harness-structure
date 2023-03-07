####################
#
# Harness Project Outputs
#
####################
output "project_details" {
  depends_on = [
    time_sleep.project_setup
  ]
  value       = harness_platform_project.project
  description = "Details for the created Harness Project"
}
