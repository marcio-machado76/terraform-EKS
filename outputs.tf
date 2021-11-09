output "region" {
  description = "AWS region"
  value       = var.region
}

output "vpc" {
  description = "Idendificador da VPC"
  value       = module.network.vpc
}

output "public_subnet" {
  description = "Subnet public "
  value       = module.network.public_subnet
}

output "private_subnet" {
  description = "Subnet private "
  value       = module.network.private_subnet
}

output "igw" {
  description = "id do internet Gateway"
  value       = module.network.igw
}

output "aws_nat_gateway" {
  description = "nat gateway id"
  value       = module.network.aws_nat_gateway
}

#
output "cluster_name" {
  value = local.cluster_name
  description = "Nome do cluster"
}

output "eks-cluster" {
  value = module.cluster.eks-cluster
  description = "id name do EKS "
}

output "endpoint" {
  description = "Endpoint do cluster"
  value       = module.cluster.endpoint
}

output "eks_node_groups" {
  value       = module.worknodes.eks_node_groups
  description = "Id do node group"
}

output "security_group_id" {
  description = "Security group id"
  value       = module.security_group.security_group_id
}

output "kubeconfig-certificate-authority-data" {
  description = "C.A do Cluster"
  value       = module.cluster.kubeconfig-certificate-authority-data
  sensitive = true
}
