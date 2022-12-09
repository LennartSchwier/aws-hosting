resource "aws_vpc" "main" {
  cidr_block = var.cidr_block_vpc

  tags = {
    Name = "main"
  }
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public_sn_main" {
  count = length(data.aws_availability_zones.availability_zones.names)

  vpc_id = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.availability_zones.names[count.index]
  cidr_block = var.cidr_blocks_subnets[count.index]

  tags = {
    Name = "main"
  }
}