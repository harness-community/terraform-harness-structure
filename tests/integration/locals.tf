locals {
  common_tags = merge(
    var.global_tags,
    {
      purpose = "terraform-testing"
    }
  )
}
