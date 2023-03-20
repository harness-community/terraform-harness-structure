# Format Project Test outputs
locals {
  project_id = module.projects_standard.project_details.id
  project_outputs = flatten([
    {
      minimum     = module.projects_minimal.project_details
      standard    = module.projects_standard.project_details
      complete    = module.projects_full.project_details
      lookup_only = module.projects_lookup_only.project_details
    }
  ])
}

module "projects_minimal" {
  depends_on = [
    time_sleep.organization_setup
  ]

  source = "../../modules/projects"

  name            = "Project Minimal"
  organization_id = local.organization_id
}

module "projects_standard" {
  depends_on = [
    time_sleep.organization_setup
  ]

  source = "../../modules/projects"

  name            = "Project Standard"
  description     = "Testing Project for Terraform Module"
  organization_id = local.organization_id
}

module "projects_full" {
  depends_on = [
    time_sleep.organization_setup
  ]

  source = "../../modules/projects"

  identifier      = "test_project_with_id"
  name            = "Project Full"
  description     = "Testing Project for Terraform Module"
  organization_id = local.organization_id
  tags = {
    type = "complete"
  }
  global_tags = local.common_tags
}

module "projects_lookup_only" {
  depends_on = [
    time_sleep.organization_setup
  ]

  source = "../../modules/projects"

  name            = "Project Minimal"
  organization_id = local.organization_id
  existing        = true
}

# Common Handler to use for dependency management across tests
resource "time_sleep" "project_setup" {
  depends_on = [
    module.projects_minimal,
    module.projects_standard,
    module.projects_full,
    module.projects_lookup_only
  ]
  create_duration = "1s"
}
