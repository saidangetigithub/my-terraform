resource "aws_vpc" "expense" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "expensevpc-${var.env}"
  }
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  vpc_id     = aws_vpc.expense.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "publicsubnets-${count.index+1}"
  }
}

resource "aws_subnet" "private" {
  count = length(var.private_subnets)
  vpc_id     = aws_vpc.expense.id
  cidr_block = var.private_subnets[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "privatesubnets-${count.index+1}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.expense.id

  tags = {
    Name = "igw-${var.env}"
  }
}

resource "aws_eip" "eip" {
  tags = {
    Name = "forngw"
  }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public[0].id
  tags = {
    Name = "ngw-${var.env}"
  }
}

resource "aws_vpc_peering_connection" "foo" {
  peer_owner_id = var.account_id
  peer_vpc_id   = var.default_vpc_id
  vpc_id        = aws_vpc.expense.id
  auto_accept   = true

  tags = {
    Name = "VPC Peering for default and expense"
  }
}

