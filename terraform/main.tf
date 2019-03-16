##################################################################
# Configure the AWS Provider
##################################################################

provider "aws" {
  region = "us-east-1"
}

##################################################################
# Data sources to get default VPC for the region
##################################################################

data "aws_vpc" "vpc" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = "${data.aws_vpc.vpc.id}"
}

##################################################################
# Create security group
##################################################################

module "security-group" "sg" {
  source = "modules/security-group"
  vpc_id = "${data.aws_vpc.vpc.id}"
}

##################################################################
# Create instances
##################################################################

module "ec2_instances" "instances" {
  source = "modules/ec2"
  prom_instances_count = 1
  prom_sg = "${module.security-group.prom_sg}"
  node_subnet_id = "${element(data.aws_subnet_ids.all.id)}"
}