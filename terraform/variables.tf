variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "app_name" {
  description = "Application Name"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "codedeploy_group" {
  description = "CodeDeploy deployment group name"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "ssm_parameters" {
  description = "SSM parameters specific to environment"
  type        = map(string)
  default     = {}
}

variable "comman_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}
}

variable "project" {
  description = "Project Name"
  type        = string
  
}
