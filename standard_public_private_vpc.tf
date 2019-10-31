# The general idea of this VPC layout is to have 2 public and 2 private subnets with consistent ip ranges
# Public subnets get resources such as load balancers, bastion hosts, and anything that needs a dedicated ip
# Private subnets all sit behind a nat gateway so as to make it easy to whitelist our outgoing traffic
# This arrangement REQUIRES that you preallocate an EIP for your nat gateway
# This arrangement REQUIRES that you prepopulate a ssh keypair for the bastion host
#	This is to prevent terraform from accidentally 'oopsieing' an EIP that you've had whitelisted by third parties
provider "aws" {
	region = "us-west-2"
	profile = "default_sts"
}
variable "env_name" {
	type = string
	description = "Name of our environment (ex: property-dev). This is injected in the name of almost every resource."
}
variable "private_nat_eip" {
	type = string
	description = "Allocation IP of the EIP we are going to attach to the private subnet nat (you need to prepopulate this)."
}
locals {
	# The overall cidr of our vpc
	vpc_range = "10.0.0.0/16"
	# public1/private1 will live in the same availability zone
	availability_zone1 = "us-west-2a"
	# same arrangement for public2/private2
	availability_zone2 = "us-west-2b"
	# I generally prefer to keep consistent 3rd octet ip ranges across all environments 
	#	and iterate the second octet per environment
	public1_range = "10.0.0.0/24"
	public2_range = "10.0.5.0/24"
	private1_range = "10.0.10.0/24"
	private2_range = "10.0.15.0/24"
	# base ami id we use for any hosts
	# ami-06d51e91cea0dac8d is ubuntu 18.04
	base_ami_id = "ami-06d51e91cea0dac8d"
	# prepopulated ssh key to be injected into our bastion host
	key_name = "id_rsa"
}
resource "aws_vpc" "main" {
	cidr_block = "${local.vpc_range}"
	tags = {
		Name = "${var.env_name}"
	}
}
# We create two public subnets for resources that need direct internet access via an internet gateway
# We need at least two subnets as application load balancers will not deploy in a single subnet
resource "aws_subnet" "public1" {
	vpc_id = "${aws_vpc.main.id}"
	availability_zone = "${local.availability_zone1}"
	cidr_block = "${local.public1_range}"
	tags = {
		Name = "${var.env_name}-public1"
	}
}
resource "aws_subnet" "public2" {
	vpc_id = "${aws_vpc.main.id}"
	availability_zone = "${local.availability_zone2}"
	cidr_block = "${local.public2_range}"
	tags = {
		Name = "${var.env_name}-public2"
	}
}
# We create two private subnets for our actual workloads
# When you deploy application servers, reverse proxies sitting behind load balancers, 
#	or ecs containers that attach to target groups you should deploy them here
resource "aws_subnet" "private1" {
	vpc_id = "${aws_vpc.main.id}"
	availability_zone = "${local.availability_zone1}"
	cidr_block = "${local.private1_range}"
	tags = {
		Name = "${var.env_name}-private1"
	}
}
resource "aws_subnet" "private2" {
	vpc_id = "${aws_vpc.main.id}"
	availability_zone = "${local.availability_zone2}"
	cidr_block = "${local.private2_range}"
	tags = {
		Name = "${var.env_name}-private2"
	}
}
resource "aws_internet_gateway" "public" {
	vpc_id = "${aws_vpc.main.id}"
	tags = {
		Name = "${var.env_name}-public"
	}
}
# Our nat gateway for the private subnets has to sit in the public subnet so that it can route out the internet gateway
# It gets our preallocated EIP which can then be whitelisted by third parties
resource "aws_nat_gateway" "private" {
	allocation_id = "${var.private_nat_eip}"
	subnet_id = "${aws_subnet.public1.id}"
	tags = {
		Name = "${var.env_name}-private"
	}
}
# We are repurposing the default routing table for our public subnets to make them as vanilla as possible
# All traffic routes out a bog standard internat gateway
# No internet access is available unless you have an EIP or AutoIP
resource "aws_default_route_table" "public" {
	default_route_table_id = "${aws_vpc.main.default_route_table_id}"
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.public.id}"
	}
	tags = {
		Name = "${var.env_name}-public"
	}
}
# We are creating a second routing table for our private subnets
# All traffic is directed to go out the nat gateway in the public subnet
# That nat gateway has our preallocated eip
resource "aws_route_table" "private" {
	vpc_id = "${aws_vpc.main.id}"
	route {
		cidr_block = "0.0.0.0/0"
		nat_gateway_id = "${aws_nat_gateway.private.id}"
	}
	tags = {
		Name = "${var.env_name}-private"
	}
}
# Associate our default routing table with the public subnets
# This will route their traffice out the internet gateway
resource "aws_route_table_association" "public1" {
	subnet_id = "${aws_subnet.public1.id}"
	route_table_id = "${aws_default_route_table.public.id}"
}
resource "aws_route_table_association" "public2" {
	subnet_id = "${aws_subnet.public2.id}"
	route_table_id = "${aws_default_route_table.public.id}"
}
# Associate our second private routing table with the private subnets
# This will route their traffic out the nat gateway eip
resource "aws_route_table_association" "private1" {
	subnet_id = "${aws_subnet.private1.id}"
	route_table_id = "${aws_route_table.private.id}"
}
resource "aws_route_table_association" "private2" {
	subnet_id = "${aws_subnet.private2.id}"
	route_table_id = "${aws_route_table.private.id}"
}
# While we aren't enforcing it, you should not edit the default security group
# It should always be a self reference all/all ingress rule
resource "aws_default_security_group" "default" {
	vpc_id = "${aws_vpc.main.id}"
	ingress {
		protocol  = -1
		self      = true
		from_port = 0
		to_port   = 0
	}
	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
	tags = {
		Name = "${var.env_name}-donotedit"
	}
}
# Stand up a bastion host we can use to access any resources we stand up in the environment
resource "aws_instance" "bastion" {
	ami = "${local.base_ami_id}"
	key_name = "${local.key_name}"
	instance_type = "t3.nano"
	associate_public_ip_address = true
	subnet_id = "${aws_subnet.public1.id}"
	tags = {
		Name = "${var.env_name}-bastion"
	}
}
# We stand up a naked load balancer since every environment will need at least one
# This load balancer runs in all of the public subnets and is added to the default security group
resource "aws_lb" "application_load_balancer" {
	name = "${var.env_name}-lb"
	load_balancer_type = "application"
	security_groups = [ "${aws_default_security_group.default.id}"]
	subnets = [ "${aws_subnet.public1.id}", "${aws_subnet.public2.id}" ]
	tags = {
		Name = "${var.env_name}-lb"
	}
}
# We add an ecs cluster for docker jobs. These cost nothing until you run workloads or stand up ec2 capacity.
resource "aws_ecs_cluster" "ecs" {
	name = "${var.env_name}"
}