output "vpc_cidrblock" {
  description = "Idendificador da VPC"
  value       = aws_vpc.vpc.cidr_block
}

output "vpc" {
  description = "Idendificador da VPC"
  value       = aws_vpc.vpc.id
}

output "public_subnet" {
  description = "Subnet public "
  value       = aws_subnet.public[*].id
}

output "private_subnet" {
  description = "Subnet private "
  value       = aws_subnet.private[*].id
}

output "igw" {
  description = "id do internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "aws_nat_gateway" {
  description = "nat gateway id"
  value       = aws_nat_gateway.nat[*].id
}
