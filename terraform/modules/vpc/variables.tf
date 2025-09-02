variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  default = "us-east-1a"
}

variable "vpc_tenency" {
  default = "default"
}

variable "vpc_enable_hostname" {
  default = true
}

variable "vpc_enable_dns" {
  default = true
}

variable "comman_tags" {
  type    = map(string)
  default = {
    Project = "POC-CodeDeploy"
  }
}

variable "name-tag" {
  type    = map(string)
  default = {
    Name = "POC-CodeDeploy-VPC"
  }
}
variable "project" {
  type    = map(string)
  default = {
    Name = "POC-CodeDeploy"
  }
}
