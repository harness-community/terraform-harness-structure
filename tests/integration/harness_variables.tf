module "variables_account" {
  depends_on = [
    time_sleep.project_setup
  ]

  source = "../../modules/variables"

  name  = "${local.organization_name}-terraform-test-var"
  value = "Test Variable"

}

module "variables_organization" {
  depends_on = [
    time_sleep.project_setup
  ]

  source = "../../modules/variables"

  name            = "${local.organization_name}-terraform-test-var"
  description     = "Harness Variable created via Terraform"
  organization_id = local.organization_id
  value           = "Test Variable"

}

module "variables_project" {
  depends_on = [
    time_sleep.project_setup
  ]

  source = "../../modules/variables"

  name            = "terraform-test-var"
  description     = "Harness Variable created via Terraform"
  organization_id = local.organization_id
  project_id      = local.project_id
  value           = "Test Value"
  tags = {
    role = "testing-var"
  }
  global_tags = local.common_tags

}
