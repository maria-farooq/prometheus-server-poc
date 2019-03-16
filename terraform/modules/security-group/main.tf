#Security Groups
resource "aws_security_group" "prometheus_host_security_group" {
  name        = "prometheus_host_security_group"
  vpc_id = "${var.vpc_id}"
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags {
    Name = "prometheus_host_security_group"
  }
}

resource "aws_security_group_rule" "sg_ingress01" {
  type            = "ingress"
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  security_group_id = "${aws_security_group.prometheus_host_security_group.id}"
  source_security_group_id = "${aws_security_group.prometheus_host_security_group.id}"
}

resource "aws_security_group_rule" "sg_ingress02" {
  type            = "ingress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  security_group_id = "${aws_security_group.prometheus_host_security_group.id}"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "sg_ingress03" {
  type            = "ingress"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  security_group_id = "${aws_security_group.prometheus_host_security_group.id}"
  cidr_blocks = ["0.0.0.0/0"]
}