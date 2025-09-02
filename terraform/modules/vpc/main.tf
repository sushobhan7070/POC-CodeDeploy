resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.vpc_tenency
  enable_dns_hostnames = var.vpc_enable_hostname
  enable_dns_support   = var.vpc_enable_dns
  tags                 = merge(var.comman_tags, var.name-tag)
}

# Single public subnet (no for_each, just one subnet)
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = merge(var.comman_tags, { "Name" = "public_subnet" })
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = merge(var.comman_tags, { "Name" = "POC-CodeDeploy-igw" })
}

# Route Table for public subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(var.comman_tags, { "Name" = "POC-CodeDeploy-public-route-table" })
}

# Route Table Association
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}
