resource "aws_eip" "nat" {
  count = length(var.public_subnet)
  vpc   = true

  tags = {
    Name = format("%s-eip", var.cluster_name)
  }
}

resource "aws_nat_gateway" "nat" {
  depends_on    = [var.igw]
  count         = length(var.public_subnet)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = var.public_subnet[count.index]

  tags = {
    Name = format("%s-nat-gateway", var.cluster_name)
  }
}

