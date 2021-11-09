// AWS VPC
data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  count_azs = length(data.aws_availability_zones.available.names)
}

resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    "Name" = var.tag_vpc
  }
}

//AWS subnets
resource "aws_subnet" "private" {
  count             = var.count_available
  cidr_block        = cidrsubnet(var.cidr, 8, (count.index + 1))
  availability_zone = data.aws_availability_zones.available.names[count.index % local.count_azs]
  vpc_id            = var.vpc

  tags = {
    Name = "Private-${count.index + 1}"
  }
}

resource "aws_subnet" "public" {
  count                   = var.count_available
  cidr_block              = cidrsubnet(var.cidr, 8, var.count_available + (count.index + 1))
  availability_zone       = data.aws_availability_zones.available.names[count.index % local.count_azs]
  vpc_id                  = var.vpc
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-${count.index + 1}"
  }
}
