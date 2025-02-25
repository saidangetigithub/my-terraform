resource "aws_vpc" "expense" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  vpc_id     = aws_vpc.expense.id
  cidr_block = var.public_cidr[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "public"
  }
}