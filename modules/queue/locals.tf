locals {
  tags = merge({
    "Description" = "Queue module"
  }, var.custom_tags)
}
