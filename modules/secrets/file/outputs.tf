####################
#
# Harness Secret File Outputs
#
####################
output "secret_details" {
  depends_on = [
    time_sleep.secret_setup
  ]
  value     = harness_platform_secret_file.file
  description = "Details for the created Harness Secret File"
  sensitive = true
}
