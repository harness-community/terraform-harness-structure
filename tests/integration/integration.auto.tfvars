# Variable Management for Harness Organization
# --------
organization_name        = "terraform-harness-structure"
organization_description = "Harness Organization Created by Terraform Module"
organization_tags = {
  purpose = "terraform-testing"
}

# Variable Management for Harness Projects
# --------
# [Required] (String) Name of the resource.
project_name = "terraform-harness-modules-project"

# [Optional] (String) Description of the resource.
project_description = "Testing Project for Terraform Module"

# [Optional] (Set of String) Tags to associate with the resource. Format key:value
project_tags = {}
