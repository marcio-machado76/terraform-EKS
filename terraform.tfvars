# Região da AWS
#
region = "us-east-1"

# vpc
# variáveis utilizadas em todos os recursos da VPC
cidr = "10.10.0.0/16"

count_available = 3 #quantidade de subnets desejadas 

tag_vpc = "vpc-devops"

tag_igw = "igw_devops"

tag_rtable = "rt-devops"

nacl = {
  100 = { protocol = "tcp", action = "allow", cidr_blocks = "0.0.0.0/0", from_port = 22, to_port = 22 }
  105 = { protocol = "tcp", action = "allow", cidr_blocks = "0.0.0.0/0", from_port = 80, to_port = 80 }
  110 = { protocol = "tcp", action = "allow", cidr_blocks = "0.0.0.0/0", from_port = 443, to_port = 443 }
  150 = { protocol = "tcp", action = "allow", cidr_blocks = "0.0.0.0/0", from_port = 1024, to_port = 65535 }
}

# Cluster
# variáveis utilizadas em todos os recursos do cluster EKS
#
tagcluster = "cluster-devops"

tagworknodes = "worker-devops"

node_instances_type = "t3.medium"

auto_scale_options = {
  min     = 3
  max     = 6
  desired = 3
}

key = "myKeyPair"

# security group
#
tag-sg = "sg-cluster_EKS"

sg-cidr = {
  22   = { to_port = 22, description = "Entrada ssh", protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
  80   = { to_port = 80, description = "Entrada http", protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
  443  = { to_port = 443, description = "Entrada https", protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
  8080 = { to_port = 8080, description = "Entrada custom para app", protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
}

# local file
file = "kubeconfig"