output "ssm_parameters" {
  description = "SSM parameter ARNs"
  value       = { for k, v in aws_ssm_parameter.app_config : k => v.arn }
}
