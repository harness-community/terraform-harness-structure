# Format Organization Test outputs
locals {
  organization_id = module.organizations_standard.organization_details.id
  organization_name = module.organizations_standard.organization_details.name
  organization_outputs = flatten([
    {
      minimum = module.organizations_minimal.organization_details
      standard = module.organizations_standard.organization_details
      complete = module.organizations_full.organization_details
    }
  ])
}

module "organizations_minimal" {
  source = "../../modules/organizations"

  name        = "${local.fmt_prefix}-terraform-harness-structure-minimum"
}

module "organizations_standard" {
  source = "../../modules/organizations"

  name        = "${local.fmt_prefix}-terraform-harness-structure-standard"
  description = "Standard Harness Organization Created by Terraform Module"
  tags        = {}
  global_tags = local.common_tags
}

module "organizations_full" {
  source = "../../modules/organizations"

  identifier  = "${local.fmt_prefix}_TerraformHarnessStructure_custom"
  name        = "${local.fmt_prefix}-terraform-harness-structure-custom"
  description = "Full Harness Organization Created by Terraform Module"
  tags        = {
    type = "complete"
  }
  global_tags = local.common_tags
}

# Common Handler to use for dependency management across tests
resource "time_sleep" "organization_setup" {
  depends_on = [
    module.organizations_minimal,
    module.organizations_standard,
    module.organizations_full
  ]
  create_duration = "1s"
}
