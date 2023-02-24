####################
#
# Harness Project Local Variables
#
####################
locals {
  required_tags = [
    "created_by:Terraform"
  ]
  # Harness Tags are read into Terraform as a standard Map entry but needs to be
  # converted into a list of key:value entries
  global_tags = [for k, v in var.global_tags : "${k}:${v}"]
  # Harness Tags are read into Terraform as a standard Map entry but needs to be
  # converted into a list of key:value entries
  tags = [for k, v in var.tags : "${k}:${v}"]

  common_tags = flatten([
    local.tags,
    local.global_tags,
    local.required_tags
  ])

  fmt_identifier = (
    var.identifier == null
    ?
    (
      lower(
        replace(
          replace(
            var.name,
            " ",
            "_"
          ),
          "-",
          "_"
        )
      )
    )
    :
    var.identifier
  )
}
