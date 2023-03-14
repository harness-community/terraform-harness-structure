####################
#
# Harness Project Outputs
#
####################
output "project_details" {
  depends_on = [
    time_sleep.project_setup
  ]
  value = (
    var.existing
    ?
    data.harness_platform_project.selected[0]
    :
    harness_platform_project.project[0]
  )
  description = "Details for the created Harness Project"
}
