resource "aws_vpc" "expense" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "expensevpc"
  }
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  vpc_id     = aws_vpc.expense.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = var.public_subnets[count.index]
  }
}

resource "aws_subnet" "private" {
  count = length(var.private_subnets)
  vpc_id     = aws_vpc.expense.id
  cidr_block = var.private_subnets[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "Main"
  }
}