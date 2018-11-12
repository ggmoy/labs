resource "aws_launch_configuration" "consul_server" {
  name_prefix   = "consul_server-"
  image_id      = "${var.consul_server_ami}"
  instance_type = "t2.micro"

  security_groups = [
    "${aws_security_group.ssh_public_sg.id}",
    "${aws_security_group.consul_servers_sg.id}"
  ]

  # The name of our SSH keypair we created above.
  key_name = "${var.key_name}"

  iam_instance_profile = "${aws_iam_instance_profile.consul_servers.name}"

  # Assing public IP address to managers
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "consul_servers" {
  name = "consul_servers"

  vpc_zone_identifier= [
      "${aws_subnet.az_a.id}",
      "${aws_subnet.az_b.id}",
      "${aws_subnet.az_c.id}"
  ]

  launch_configuration = "${aws_launch_configuration.consul_server.name}"
#  load_balancers = ["${aws_elb.consul_servers.name}"]
  health_check_grace_period = 60

  desired_capacity = 5
  min_size         = 5
  max_size         = 5

  lifecycle {
    create_before_destroy = true
  }

#  depends_on = ["aws_efs_file_system.swarm_cluster_efs"]
}
