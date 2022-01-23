resource "tls_private_key" "key" {
  algorithm = "RSA"
}

resource "local_file" "priv_key" {
  filename          = "${var.project_name}-key.pem"
  sensitive_content = tls_private_key.key.private_key_pem
  file_permission   = "0400"
}

resource "aws_key_pair" "key_pair" {
  key_name   = "${var.project_name}-key"
  public_key = tls_private_key.key.public_key_openssh
}
