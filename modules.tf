module "vpc" {
  source           = "./modules/vpc"

  project_name     = "${var.project_name}"
  region           = "${var.region}"
  environment      = "${var.environment}"
  vpc_cidr_block   = "${var.vpc_cidr_block}"
  pub_subnet_cidr  = "${var.pub_subnet_cidr}"
  priv_subnet_cidr = "${var.priv_subnet_cidr}"
}
