####################
#
# Harness Secret Text Outputs
#
####################
# 2023-03-16
# This output is being deprecated and replaced by the output
# labeled `details`
output "secret_details" {
  depends_on = [
    time_sleep.secret_setup
  ]
  value       = harness_platform_secret_text.text
  description = "Details for the created Harness Secret Text"
  sensitive   = true
}

output "details" {
  depends_on = [
    time_sleep.secret_setup
  ]
  value       = harness_platform_secret_text.text
  description = "Details for the created Harness Secret Text"
  sensitive   = true
}
