variable "private_subnet" {
  description = "Id das subnets"
  type        = list(string)
}

variable "cluster_name" {
  description = "Nome do cluster"
  type        = string
}

variable "tagworknodes" {
  description = "tags do worknodes"
}


variable "auto_scale_options" {
  description = " Quantidade minima, maxima e desejada do auto scaling"
  type        = map(any)
}

variable "node_instances_type" {
  description = "tipo das instancias"
  type        = string
}

variable "eks-cluster" {
  description = "id do cluster EKS"
  type        = string
}

variable "security_group_id" {
  description = "Id do security group"
}

variable "key" {
  description = "Nome da key pair"
  type        = string
}