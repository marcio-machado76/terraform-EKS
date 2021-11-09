output "eks-cluster" {
  description = "description"
  value = aws_eks_cluster.cluster.name
}

output "endpoint" {
  description = "Endpoint do cluster EKS"
  value = aws_eks_cluster.cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  description = "Certificado do cluster"
  value = aws_eks_cluster.cluster.certificate_authority[0].data
}

