resource "aws_eks_node_group" "nodegroup" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.tagworknodes}-${var.cluster_name}"
  node_role_arn   = aws_iam_role.eks-node-role.arn
  instance_types  = [var.node_instances_type]

  subnet_ids = var.private_subnet

  scaling_config {
    desired_size = lookup(var.auto_scale_options, "desired")
    max_size     = lookup(var.auto_scale_options, "max")
    min_size     = lookup(var.auto_scale_options, "min")
  }
  update_config {
    max_unavailable = 2
  }
  remote_access {
    ec2_ssh_key               = var.key
    source_security_group_ids = [var.security_group_id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
    var.eks-cluster,
  ]

  tags = {
    Name = var.tagworknodes
  }
}
