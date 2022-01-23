// For vpc
variable "project_name" {}
variable "region" {}
variable "environment" {}
variable "vpc_cidr_block" {}
variable "route_destination_cidr_block" {}
variable "sg_cidr_blocks_inbound" {}
variable "sg_cidr_blocks_outbound" {}
variable "pub_subnet_cidr" {}
variable "priv_subnet_cidr" {}
variable "pub_zone" {}
variable "priv_zone" {}

// For ec2
variable "ami" {}
variable "instance_type" {}
