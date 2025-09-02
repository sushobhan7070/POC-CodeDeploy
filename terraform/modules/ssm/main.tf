resource "aws_ssm_parameter" "app_config" {
  for_each = var.parameters

  name        = "/${var.project}/${each.key}"
  description = "App config parameter for ${each.key} in ${var.project}"
  type        = "String"
  value       = each.value

  tags = merge(
    var.comman_tags,
    {
      "Name"     = "${var.project}-ssm-${each.key}"
      "Resource" = "SSM-Parameter"
    }
  )
}
