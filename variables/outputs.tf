####################
#
# Harness Variable Outputs
#
####################
output "variable_details" {
  depends_on = [
    time_sleep.variable_setup
  ]
  value = harness_platform_variables.var
}

output "success" {
  depends_on = [
    time_sleep.variable_setup
  ]
  value = true
}
