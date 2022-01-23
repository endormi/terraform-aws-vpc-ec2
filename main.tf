module "vpc" {
  source                       = "./modules/vpc"

  project_name                 = "${var.project_name}"
  region                       = "${var.region}"
  environment                  = "${var.environment}"
  vpc_cidr_block               = "${var.vpc_cidr_block}"
  route_destination_cidr_block = "${var.route_destination_cidr_block}"
  sg_cidr_blocks_inbound       = "${var.sg_cidr_blocks_inbound}"
  sg_cidr_blocks_outbound      = "${var.sg_cidr_blocks_outbound}"
  pub_subnet_cidr              = "${var.pub_subnet_cidr}"
  priv_subnet_cidr             = "${var.priv_subnet_cidr}"
  pub_zone                     = "${var.pub_zone}"
  priv_zone                    = "${var.priv_zone}"
}

module "ec2" {
  source        = "./modules/ec2"

  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  pub_sub_id    = module.vpc.pub_sub_id
  priv_sub_id   = module.vpc.priv_sub_id
  pub_sg_id     = module.vpc.pub_sg_id
  priv_sg_id    = module.vpc.priv_sg_id

  project_name  = "${var.project_name}"
  environment   = "${var.environment}"
}
