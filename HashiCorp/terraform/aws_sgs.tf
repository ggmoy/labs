# Security group for public SSH access
resource "aws_security_group" "ssh_public_sg" {
  name        = "ssh-public-sg"
  description = "Public SSH access"
  vpc_id      = "${aws_vpc.default.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security group for Consul Servers
resource "aws_security_group" "consul_servers_sg" {
  name        = "consul-servers-sg"
  description = "SG applied to Consul Servers"
  vpc_id      = "${aws_vpc.default.id}"
 
  ingress {
    from_port = 8300
    to_port   = 8300
    protocol  = "tcp"
    cidr_blocks = [
      "${aws_subnet.az_a.cidr_block}",
      "${aws_subnet.az_b.cidr_block}",
      "${aws_subnet.az_c.cidr_block}"
    ]
  }

  ingress {
    from_port = 8301
    to_port   = 8301
    protocol  = "tcp"
    cidr_blocks = [
      "${aws_subnet.az_a.cidr_block}",
      "${aws_subnet.az_b.cidr_block}",
      "${aws_subnet.az_c.cidr_block}"
    ]
  }

  ingress {
    from_port = 8301
    to_port   = 8301
    protocol  = "udp"
    cidr_blocks = [
      "${aws_subnet.az_a.cidr_block}",
      "${aws_subnet.az_b.cidr_block}",
      "${aws_subnet.az_c.cidr_block}"
    ]
  }

  ingress {
    from_port = 8302
    to_port   = 8302
    protocol  = "tcp"
    cidr_blocks = [
      "${aws_subnet.az_a.cidr_block}",
      "${aws_subnet.az_b.cidr_block}",
      "${aws_subnet.az_c.cidr_block}"
    ]
  }

  ingress {
    from_port = 8302
    to_port   = 8302
    protocol  = "udp"
    cidr_blocks = [
      "${aws_subnet.az_a.cidr_block}",
      "${aws_subnet.az_b.cidr_block}",
      "${aws_subnet.az_c.cidr_block}"
    ]
  }

  ingress {
    from_port = 8400
    to_port   = 8400
    protocol  = "tcp"
    cidr_blocks = [
      "${aws_subnet.az_a.cidr_block}",
      "${aws_subnet.az_b.cidr_block}",
      "${aws_subnet.az_c.cidr_block}"
    ]
  }

  ingress {
    from_port = 8500
    to_port   = 8500
    protocol  = "tcp"
    cidr_blocks = [
      "${aws_subnet.az_a.cidr_block}",
      "${aws_subnet.az_b.cidr_block}",
      "${aws_subnet.az_c.cidr_block}"
    ]
  }
}
