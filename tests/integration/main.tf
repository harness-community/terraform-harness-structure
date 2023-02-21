module "organizations" {

  source = "../../organizations"

  name        = "${var.prefix}-${var.organization_name}"
  description = var.organization_description
  tags        = var.organization_tags
  global_tags = var.global_tags
}
