module "organizations" {

  source = "../../organizations"

  name        = "${var.prefix}-${var.organization_name}"
  description = var.organization_description
  tags        = var.organization_tags
  global_tags = var.global_tags
}

module "projects" {
  depends_on = [
    module.organizations.orgs
  ]

  source = "../../projects"

  name            = var.project_name
  organization_id = module.organizations.organization_details.id
  color           = var.project_color
  description     = var.project_description
  tags            = var.project_tags
  global_tags     = var.global_tags
}
