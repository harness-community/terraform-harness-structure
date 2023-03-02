####################
#
# Harness Secret Text Outputs
#
####################
output "secret_details" {
  depends_on = [
    time_sleep.secret_setup
  ]
  value       = harness_platform_secret_text.text
  description = "Details for the created Harness Secret Text"
  sensitive   = true
}
