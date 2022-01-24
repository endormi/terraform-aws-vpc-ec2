output "ec2_public_ip" {
  value = module.ec2.pub_ec2_ip
}

output "ec2_private_ip" {
  value = module.ec2.priv_ec2_ip
}

output "ec2_private_id" {
  value = module.ec2.priv_instance_id
}

output "igw_id" {
  value = module.vpc.igw_id
}
