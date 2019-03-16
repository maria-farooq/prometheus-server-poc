##################################################################
# EC2 instance resource, to create an instance of our desire
##################################################################

resource "aws_instance" "instance" {
  ami           = "${data.aws_ami.amazon_linux.id}"
  instance_type = "m4.large"
  ebs_optimized = true
  monitoring = true
  vpc_security_group_ids = ["${var.prom_sg}"]
  subnet_id = "${var.node_subnet_id}"
  count = "${var.prom_instances_count}"
  root_block_device {
    volume_size = 40
    volume_type = "gp2"
    delete_on_termination = true
  }

  tags = {
    Name = "${format("prometheus-%03d", count.index)}"
  }
}

##################################################################
# Data sources to get most recent amazon linux ami
##################################################################

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}