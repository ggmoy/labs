# Consul Servers ELB
#resource "aws_elb" "consul_servers_elb" {
#  name = "consul-servers-elb"
#
#  subnets = [
#    "${aws_subnet.az_a.id}",
#    "${aws_subnet.az_b.id}",
#    "${aws_subnet.az_c.id}"
#  ]
#
#  security_groups = [
#    "${aws_security_group.jenkins_elb_sg.id}"
#  ]
#
#  listener {
#    instance_port     = 80
#    instance_protocol = "http"
#    lb_port           = 80
#    lb_protocol       = "http"
#  }
#}
