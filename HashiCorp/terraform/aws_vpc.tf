# Create a VPC to launch our instances into
resource "aws_vpc" "default" {
  cidr_block           = "10.76.0.0/16"
  enable_dns_hostnames = true

  tags {
    Name = "hashilab"
  }
}

# Create an internet gateway to give our subnets access to the outside world
resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "hashilab"
  }
}

# Grant the VPC internet access on its main route table
resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.default.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.default.id}"
}

##
# Create subnets to launch our instances into
##
resource "aws_subnet" "az_a" {
  vpc_id                  = "${aws_vpc.default.id}"
  cidr_block              = "10.76.1.0/24"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = false

  tags {
    Name = "hashilab"
  }
}

resource "aws_subnet" "az_b" {
  vpc_id                  = "${aws_vpc.default.id}"
  cidr_block              = "10.76.2.0/24"
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = false

  tags {
    Name = "hashilab"
  }
}

resource "aws_subnet" "az_c" {
  vpc_id                  = "${aws_vpc.default.id}"
  cidr_block              = "10.76.3.0/24"
  availability_zone       = "${var.aws_region}c"
  map_public_ip_on_launch = false

  tags {
    Name = "hashilab"
  }
}
