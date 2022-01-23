output "pub_instance_id" {
  value = aws_instance.pub_ec2.id
}

output "priv_instance_id" {
  value = aws_instance.priv_ec2.id
}
