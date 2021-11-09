resource "aws_security_group" "sg-cluster" {
  name        = "sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc


  dynamic "ingress" {
    for_each = var.sg-cidr
    content {
      description = ingress.value["description"]
      from_port   = ingress.key
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Outbound all "

  }

  tags = {
    Name = var.tag-sg
  }
}
