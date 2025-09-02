variable "project" {
  type        = string
  description = "Project/Environment name"
}

variable "codedeploy_role_arn" {
  type        = string
  description = "IAM Role ARN for CodeDeploy"
}

variable "ec2_tag_key" {
  type        = string
  description = "Tag key used to identify instances for deployment group"
}

variable "ec2_tag_value" {
  type        = string
  description = "Tag value used to identify instances for deployment group"
}
