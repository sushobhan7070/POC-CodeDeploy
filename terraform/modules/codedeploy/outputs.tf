output "codedeploy_app_name" {
  value = aws_codedeploy_app.app.name
}

output "codedeploy_deployment_group" {
  value = aws_codedeploy_deployment_group.dg.deployment_group_name
}
