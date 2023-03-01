####################
#
# Harness Secret File
#
####################
resource "harness_platform_secret_file" "file" {
  # [Required] (String) Unique identifier of the resource.
  identifier = local.fmt_identifier

  # [Required] (String) Name of the resource.
  name = var.name

  # [Optional] (String) Unique identifier of the organization.
  org_id = var.organization_id

  # [Optional] (String) Unique identifier of the project.
  project_id = var.project_id

  # [Optional] (String) Description of the resource.
  description = var.description

  # [Required] (String) Identifier of the Secret Manager used to manage the secret.
  secret_manager_identifier = var.secret_manager

  # [Required] (String) Path of the file containing secret value
  file_path = var.file_path

  # [Optional] (Set of String) Tags to associate with the resource.
  tags = local.common_tags

}



# When creating a new Secret, there is a potential race-condition
# as the secret is available.  This resource will introduce
# a slight delay in further execution to wait for the resources to
# complete.
resource "time_sleep" "secret_setup" {
  depends_on = [
    harness_platform_secret_file.file
  ]

  create_duration  = "15s"
  destroy_duration = "15s"
}
