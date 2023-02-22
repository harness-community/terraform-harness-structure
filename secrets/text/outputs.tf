output "secret_details" {
  depends_on = [
    time_sleep.secret_setup
  ]
  value     = harness_platform_secret_text.text
  sensitive = true
}

output "success" {
  depends_on = [
    time_sleep.secret_setup
  ]
  value = true
}
