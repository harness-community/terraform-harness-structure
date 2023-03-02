locals {
  fmt_prefix = (
    lower(
      replace(
        replace(
          var.prefix,
          " ",
          "_"
        ),
        "-",
        "_"
      )
    )
  )

  common_tags = merge(
    var.global_tags,
    {
      purpose = "terraform-testing"
    }
  )
}
