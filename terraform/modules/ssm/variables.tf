variable "project" {
  description = "Project name or environment"
  type        = string
}

variable "comman_tags" {
  description = "Common tags applied to resources"
  type        = map(string)
}

variable "parameters" {
  description = "Map of SSM parameters to create"
  type        = map(string)
}
