provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Environment = "Production"
      Owner       = "TerraformAWS"
      Project     = "DesafioTecnicoDevOps"
    }
  }
}

locals {
  cluster_name = "devops-cluster"
}

module "network" {
  source          = "./network"
  region          = var.region
  cidr            = var.cidr
  count_available = var.count_available
  vpc             = module.network.vpc
  igw             = module.network.igw
  public_subnet   = module.network.public_subnet
  private_subnet  = module.network.private_subnet
  aws_nat_gateway = module.network.aws_nat_gateway
  tag_vpc         = var.tag_vpc
  tag_igw         = var.tag_igw
  tag_rtable      = var.tag_rtable
  nacl            = var.nacl
  cluster_name    = local.cluster_name
}

module "security_group" {
  source  = "./security_group"
  vpc     = module.network.vpc
  sg-cidr = var.sg-cidr
  tag-sg  = var.tag-sg
}

module "cluster" {
  source         = "./cluster"
  vpc            = module.network.vpc
  private_subnet = module.network.private_subnet
  cluster_name   = local.cluster_name
  tagcluster     = var.tagcluster
  security_group_id = module.security_group.security_group_id
}

module "worknodes" {
  source              = "./worknodes"
  private_subnet      = module.network.private_subnet
  cluster_name        = local.cluster_name
  auto_scale_options  = var.auto_scale_options
  tagworknodes        = var.tagworknodes
  eks-cluster         = module.cluster.eks-cluster
  node_instances_type = var.node_instances_type
}

resource "local_file" "kubeconfig" {
    content  = module.cluster.kubeconfig-certificate-authority-data
    filename = var.file
}