output "prom_sg" {
  value = "${aws_security_group.prometheus_host_security_group.id}"
}