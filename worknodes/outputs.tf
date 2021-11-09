output "eks_node_groups" {
  value       = aws_eks_node_group.nodegroup.id
  description = "Id do node group"
}
