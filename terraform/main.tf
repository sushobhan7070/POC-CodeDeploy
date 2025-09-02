module "vpc" {
  source = "./modules/vpc"

  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  availability_zone   = "us-east-1a"
  vpc_tenency         = "default"
  vpc_enable_hostname = true
  vpc_enable_dns      = true

  comman_tags = {
    Project = "POC-CodeDeploy"
    Env     = "dev"
  }

  name-tag = {
    Name = "POC-CodeDeploy-VPC"
  }
}

module "ec2" {
  source        = "./modules/ec2"
  instance_type = "t2.micro"
  key_name      = "your-keypair-name"
  subnet_id     = module.vpc.public_subnet_id
  vpc_id        = module.vpc.vpc_id
  project       = "POC-CodeDeploy"
  ami_id        = "ami-0000000"  
  iam_instance_profile = module.iam.ec2_instance_profile
}

module "iam" {
  source  = "./modules/iam"
  project = "POC-CodeDeploy"
}

module "s3" {
  source  = "./modules/s3"
  project = "POC-CodeDeploy"
}

module "codedeploy" {
  source            = "./modules/codedeploy"
  project           = "POC-CodeDeploy"
  codedeploy_role_arn = module.iam.codedeploy_role_arn
  ec2_tag_key       = "App"
  ec2_tag_value     = "POC"
}

module "ssm" {
  source       = "./modules/ssm"
  project      = var.project
  comman_tags  = var.comman_tags
  parameters   = var.ssm_parameters
}


