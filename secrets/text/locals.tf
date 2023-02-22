locals {

  required_tags = [
    "created_by:Terraform"
  ]
  # Harness Tags are read into Terraform as a standard Map entry but needs to be
  # converted into a list of key:value entries
  tags = [for k, v in var.tags : "${k}:${v}"]

  common_tags = flatten([
    local.tags,
    local.required_tags
  ])

  fmt_identifier = (
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
}
