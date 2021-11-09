# Terraform + AWS EKS
- [x] Status:  Ainda em desenvolvimento.
## Descrição do projeto
 - Este projeto tem como objetivo automatizar a criação de um cluster kubernetes na AWS utilizando o terraform para criar a infraestrutura necessária para o EKS.
 - O Amazon Elastic Kubernetes Service (Amazon EKS) é um serviço de contêiner gerenciado para executar e escalar aplicações 
  do Kubernetes.
 - Este projeto tem uma estrutura separada por módulos e para que fique mais dinâmico e fácil fazer alterações, todas as variáveis estão concentradas no 
  módulo root no arquivo `terraform.tfvars`.
 - Para facilitar a identificação dos recursos criados neste projeto foi utilizado um recurso conhecido como `default tags`, que tem a capacidade de 
  definir tags padrão no nível do provedor, simplificando o gerenciamento de tags. Com este recurso podemos definir tags padrão no bloco do provedor na 
  configuração do terraform e todas as tags definidas ali também serão herdadas por módulos dependentes do terraform, **exceto** o `auto scaling groups` que possue 
  uma solução alternativa.
 
### Mais sobre default tags.
  - Default tags é uma maneira fácil de padronizar sua configuração do [Terraform](https://www.hashicorp.com/blog/default-tags-in-the-terraform-aws-provider) de acordo com [as práticas recomendadas da AWS.](https://d1.awsstatic.com/whitepapers/aws-tagging-best-practices.pdf) 
   
## Abaixo segue a tabela de requerimentos de versões, módulos, recursos, inputs e outputs.
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.1.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cluster"></a> [cluster](#module\_cluster) | ./cluster | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./network | n/a |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | ./security_group | n/a |
| <a name="module_worknodes"></a> [worknodes](#module\_worknodes) | ./worknodes | n/a |

### Resources

| Name | Type |
|------|------|
| [local_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_scale_options"></a> [auto\_scale\_options](#input\_auto\_scale\_options) | Opções mínima, máxima e desejada de auto scaling do cluster | `map(any)` | n/a | yes |
| <a name="input_cidr"></a> [cidr](#input\_cidr) | CIDR da VPC | `string` | n/a | yes |
| <a name="input_count_available"></a> [count\_available](#input\_count\_available) | Numero de Zonas de disponibilidade | `number` | n/a | yes |
| <a name="input_file"></a> [file](#input\_file) | Local e nome do arquivo para armazenar o output do kubeconfig-certificate | `string` | n/a | yes |
| <a name="input_nacl"></a> [nacl](#input\_nacl) | Regras de Network Acls AWS | `map(any)` | n/a | yes |
| <a name="input_node_instances_type"></a> [node\_instances\_type](#input\_node\_instances\_type) | tipo das instancias | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Região na AWS | `string` | n/a | yes |
| <a name="input_sg-cidr"></a> [sg-cidr](#input\_sg-cidr) | Mapa de portas de serviços | `map(any)` | n/a | yes |
| <a name="input_tag-sg"></a> [tag-sg](#input\_tag-sg) | Tag name do security group | `string` | n/a | yes |
| <a name="input_tag_igw"></a> [tag\_igw](#input\_tag\_igw) | Tag Name do internet gateway | `string` | n/a | yes |
| <a name="input_tag_rtable"></a> [tag\_rtable](#input\_tag\_rtable) | Tag Name das route tables | `string` | n/a | yes |
| <a name="input_tag_vpc"></a> [tag\_vpc](#input\_tag\_vpc) | Tag Name da VPC | `string` | n/a | yes |
| <a name="input_tagcluster"></a> [tagcluster](#input\_tagcluster) | Tag name do cluster | `string` | n/a | yes |
| <a name="input_tagworknodes"></a> [tagworknodes](#input\_tagworknodes) | Tag name do worker node | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_nat_gateway"></a> [aws\_nat\_gateway](#output\_aws\_nat\_gateway) | nat gateway id |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Nome do cluster |
| <a name="output_eks-cluster"></a> [eks-cluster](#output\_eks-cluster) | id name do EKS |
| <a name="output_eks_node_groups"></a> [eks\_node\_groups](#output\_eks\_node\_groups) | Id do node group |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | Endpoint do cluster |
| <a name="output_igw"></a> [igw](#output\_igw) | id do internet Gateway |
| <a name="output_kubeconfig-certificate-authority-data"></a> [kubeconfig-certificate-authority-data](#output\_kubeconfig-certificate-authority-data) | C.A do Cluster |
| <a name="output_private_subnet"></a> [private\_subnet](#output\_private\_subnet) | Subnet private |
| <a name="output_public_subnet"></a> [public\_subnet](#output\_public\_subnet) | Subnet public |
| <a name="output_region"></a> [region](#output\_region) | AWS region |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | Security group id |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | Idendificador da VPC |



## Como usar.
  - Para utilizar localmente , baixe o repositório e altere as variáveis localizadas no arquivo `terraform.tfvars` de acordo com a necessidade.
  - A variável `count_available` define o quantidade de zonas de disponibilidade, públicas e privadas que seram criadas.
  - Certifique-se que possua as credenciais da AWS - **`AWS_ACCESS_KEY_ID`** e **`AWS_SECRET_ACCESS_KEY`**.

#
### Comandos
Para executar comandos no cluster é necessário ter o docker e o kubectl instalados.
Para utilizar os módulos deste repositório é necessário ter o terraform instalado ou utilizar o container do terraform dentro da pasta do seu projeto da seguinte forma:

* `docker run -it --rm -v $PWD:/app -w /app --entrypoint "" hashicorp/terraform:light sh` 
    
Em seguida exporte as credenciais da AWS:

* `export AWS_ACCESS_KEY_ID=sua_access_key_id`
* `export AWS_SECRET_ACCESS_KEY=sua_secret_access_key`
    
Agora é só executar os comandos do terraform:

* `terraform init` - Comando irá baixar todos os modulos e plugins necessários.
* `terraform plan` - Para criar um plano de todos os recursos que serão utilizados.
* `terraform apply` - Para aplicar a criação/alteração dos recursos. 

### Aguarde a criação do cluster EKS, após concluir execute os comandos abaixo:
* Conectar ao cluster.            
  `$ aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)`

* Pegar o kubeconfig.            
  `$ aws sts get-caller-identity`

* Preencha o espaço abaixo com o nome do cluster e execute o comando.            
  `$ aws eks --region us-east-1 update-kubeconfig --name <NOME_CLUSTER>`

* Verificar o kubeconfig.            
  `$ cat ~/.kube/config`

* Verificar os nós do cluster.            
  `$ kubectl get nodes`

* Para destruir toda a estrutura criada execute o comando abaixo.
* `terraform destroy` - Para destruir todos os recursos que foram criados pelo terraform. 

