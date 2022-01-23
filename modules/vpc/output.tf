output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "pub_sg_id" {
  value = aws_security_group.pub_sg.id
}

output "priv_sg_id" {
  value = aws_security_group.priv_sg.id
}

output "pub_sub_id" {
  value = aws_subnet.pub_subnet.id
}

output "priv_sub_id" {
  value = aws_subnet.priv_subnet.id
}
