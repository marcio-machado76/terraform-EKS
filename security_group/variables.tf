variable "vpc" {
  description = "Id da VPC"
  type        = string
}

variable "sg-cidr" {
  description = "Mapa de portas de serviços"
  type        = map(any)
}


variable "tag-sg" {
  description = "Tag name do security group"
  type = string
}
