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
  sensitive = true
}

output "success" {
  depends_on = [
    time_sleep.secret_setup
  ]
  value = true
}
