output "ec2_instance_profile" {
  value = aws_iam_instance_profile.ec2_instance_profile.name
}

output "codedeploy_role_arn" {
  value = aws_iam_role.codedeploy_role.arn
}
