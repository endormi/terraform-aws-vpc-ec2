output "pub_instance_id" {
  value = aws_instance.pub_ec2.id
}

output "priv_instance_id" {
  value = aws_instance.priv_ec2.id
}

output "pub_ec2_ip" {
  value = aws_instance.pub_ec2.public_ip
}

output "priv_ec2_ip" {
  value = aws_instance.priv_ec2.private_ip
}
