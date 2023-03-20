####################
#
# Harness Variable Outputs
#
####################
# 2023-03-16
# This output is being deprecated and replaced by the output
# labeled `details`
output "variable_details" {
  depends_on = [
    time_sleep.variable_setup
  ]
  value       = harness_platform_variables.var
  description = "Details for the created Harness Variable"
}

output "details" {
  depends_on = [
    time_sleep.variable_setup
  ]
  value       = harness_platform_variables.var
  description = "Details for the created Harness Variable"
}
