module "organizations" {

  source = "../../organizations"

  name        = "${var.prefix}-terraform-harness-structure"
  description = "Harness Organization Created by Terraform Module"
  tags        = {}
  global_tags = local.common_tags
}

module "projects" {
  depends_on = [
    module.organizations.orgs
  ]

  source = "../../projects"

  name            = "terraform-harness-modules-project"
  description     = "Testing Project for Terraform Module"
  organization_id = module.organizations.organization_details.id
  tags            = {}
  global_tags     = local.common_tags
}

module "secret_text" {
  depends_on = [
    module.projects.project_details
  ]

  source = "../../secrets/text"

  name            = "terraform-test-secret"
  description     = "Harness Secret Text created via Terraform"
  organization_id = module.organizations.organization_details.id
  project_id      = module.projects.project_details.id
  secret_manager  = "harnessSecretManager"
  value_type      = "Inline"
  value           = "Nothing"
  tags            = {}

}

module "variables" {
  depends_on = [
    module.projects.project_details
  ]

  source = "../../variables"

  name            = "terraform-test-var"
  description     = "Harness Variable created via Terraform"
  organization_id = module.organizations.organization_details.id
  project_id      = module.projects.project_details.id
  value           = "Nothing"
  tags            = {}

}
