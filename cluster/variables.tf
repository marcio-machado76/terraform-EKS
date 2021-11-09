variable "vpc" {
  type        = string
  description = "Id da VPC"
}

variable "private_subnet" {
  description = "Id das subnets"
  type        = list(string)
}

variable "cluster_name" {
  description = "Nome do cluster"
  type        = string
}

variable "tagcluster" {
  description = "Tag name do cluster"
  type        = string
}

variable "security_group_id" {
  description = "Id do security group"

}