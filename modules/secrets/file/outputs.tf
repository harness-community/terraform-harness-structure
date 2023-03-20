####################
#
# Harness Secret File Outputs
#
####################
# 2023-03-16
# This output is being deprecated and replaced by the output
# labeled `details`
output "secret_details" {
  depends_on = [
    time_sleep.secret_setup
  ]
  value       = harness_platform_secret_file.file
  description = "Details for the created Harness Secret File"
  sensitive   = true
}

output "details" {
  depends_on = [
    time_sleep.secret_setup
  ]
  value       = harness_platform_secret_file.file
  description = "Details for the created Harness Secret File"
  sensitive   = true
}
