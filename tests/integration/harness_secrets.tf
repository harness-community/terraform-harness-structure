# Text
module "secret_text_account" {
  depends_on = [
    time_sleep.project_setup
  ]

  source = "../../secrets/text"

  name            = "${local.organization_name}-terraform-test-secret-text"
  value           = "Nothing"

}

module "secret_text_org" {
  depends_on = [
    time_sleep.project_setup
  ]

  source = "../../secrets/text"

  name            = "${local.organization_name}-terraform-test-secret-text"
  description     = "Harness Secret Text created via Terraform"
  organization_id = local.organization_id
  value           = "Nothing"
  tags            = local.common_tags

}

module "secret_text_project" {
  depends_on = [
    time_sleep.project_setup
  ]

  source = "../../secrets/text"

  name            = "terraform-test-secret-text"
  description     = "Harness Secret Text created via Terraform"
  organization_id = local.organization_id
  project_id      = local.project_id
  secret_manager  = "harnessSecretManager"
  value_type      = "Inline"
  value           = "Nothing"
  tags            = {
    role = "project"
  }
  global_tags     = local.common_tags

}

# Files
module "secret_file_account" {
  depends_on = [
    time_sleep.project_setup
  ]


  source = "../../secrets/file"

  name            = "${local.organization_name}-terraform-test-secret-file"
  file_path      = "${path.module}/README.md"

}
module "secret_file_org" {
  depends_on = [
    time_sleep.project_setup
  ]


  source = "../../secrets/file"

  name            = "${local.organization_name}-terraform-test-secret-file"
  description     = "Harness Secret Text created via Terraform"
  organization_id = local.organization_id
  file_path      = "${path.module}/README.md"
  tags            = local.common_tags

}
module "secret_file_project" {
  depends_on = [
    time_sleep.project_setup
  ]


  source = "../../secrets/file"

  name            = "terraform-test-secret-file"
  description     = "Harness Secret Text created via Terraform"
  organization_id = local.organization_id
  project_id      = local.project_id
  secret_manager  = "harnessSecretManager"
  file_path       = "${path.module}/README.md"
  tags            = {
    role = "testing"
  }
  global_tags     = local.common_tags

}
