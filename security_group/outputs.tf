output "security_group_id" {
  description = "Security group id"
  value       = aws_security_group.sg-cluster.id
}