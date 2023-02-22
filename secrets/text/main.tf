# Secrets Management

resource "harness_platform_secret_text" "text" {

  # [Required] (String) Unique identifier of the resource.
  identifier = local.fmt_identifier

  # [Required] (String) Name of the resource.
  name = var.name

  # [Optional] (String) Description of the resource.
  description = var.description

  # [Required] (String) Identifier of the Secret Manager used to manage the secret.
  secret_manager_identifier = var.secret_manager

  # [Required] (String) This has details to specify if the secret value is Inline or Reference.
  value_type = var.value_type

  # [Optional] (String, Sensitive) Value of the Secret
  value = var.value

  # [Optional] (String) Unique identifier of the organization.
  org_id = var.organization_id

  # [Optional] (String) Unique identifier of the project.
  project_id = var.project_id

  # [Optional] (Set of String) Tags to associate with the resource.
  tags = local.common_tags

}



# When creating a new Project, there is a potential race-condition
# as the project comes up.  This resource will introduce
# a slight delay in further execution to wait for the resources to
# complete.
resource "time_sleep" "secret_setup" {
  depends_on = [
    harness_platform_secret_text.text
  ]

  create_duration  = "15s"
  destroy_duration = "15s"
}
