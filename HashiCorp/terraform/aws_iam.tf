resource "aws_iam_instance_profile" "consul_servers" {
  name = "consul-servers"
  role = "${aws_iam_role.consul_servers.name}"
}

resource "aws_iam_role" "consul_servers" {
  name = "consul-servers"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "consul_servers" {
  name = "consul-servers"
  description = "Policy for Consul Servers"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "ec2:DescribeInstances",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "consul_servers" {
  role       = "${aws_iam_role.consul_servers.name}"
  policy_arn = "${aws_iam_policy.consul_servers.arn}"
}
