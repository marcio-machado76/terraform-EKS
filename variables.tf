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

# Cluster
#

variable "tagcluster" {
  description = "Tag name do cluster"
  type        = string
}

variable "tagworknodes" {
  description = "Tag name do worker node"
  type        = string
}


variable "auto_scale_options" {
  description = " Opções mínima, máxima e desejada de auto scaling do cluster"
  type        = map(any)
}

variable "node_instances_type" {
  description = "tipo das instancias"
  type        = string
}

variable "key" {
  description = "Nome da key pair"
  type        = string
}

# security group
#
variable "sg-cidr" {
  description = "Mapa de portas de serviços"
  type        = map(any)
}


variable "tag-sg" {
  description = "Tag name do security group"
  type        = string
}

# Local file
#
variable "file" {
  description = "Local e nome do arquivo para armazenar o output do kubeconfig-certificate"
  type        = string
}