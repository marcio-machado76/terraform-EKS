resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc

  tags = {
    Name = var.tag_igw
  }
}