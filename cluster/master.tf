resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks-cluster-role.arn
  version  = "1.21"

  tags = {
    Name = var.tagcluster
  }

  vpc_config {
    security_group_ids = [
      var.security_group_id
    ]
    subnet_ids = var.private_subnet
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
  ]
}
