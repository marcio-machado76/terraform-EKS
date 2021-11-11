variable "region" {
  type        = string
  description = "Região na AWS"
}

variable "cidr" {
  description = "CIDR da VPC"
  type        = string
}

variable "count_available" {
  type        = number
  description = "Numero de Zonas de disponibilidade"
}

variable "tag_vpc" {
  description = "Tag Name da VPC"
  type        = string
}

variable "aws_nat_gateway" {
  description = "nat gateway id"
  type        = list(string)
}

variable "tag_igw" {
  description = "Tag Name do internet gateway"
  type        = string
}

variable "tag_rtable" {
  description = "Tag Name das route tables"
  type        = string
}

variable "nacl" {
  description = "Regras de Network Acls AWS"
  type        = map(any)
  #type        = map(object({ protocol = string, action = string, cidr_blocks = string, from_port = number, to_port = number }))
}

variable "vpc" {
  type        = string
  description = "Id da VPC"
}

variable "cluster_name" {
  description = "Nome do cluster"
  type        = string
}

variable "public_subnet" {
  description = "id das subnets"
}

variable "private_subnet" {
  description = "id das subnets"
}

variable "igw" {
  type        = string
  description = "Id do internet gateway"
}