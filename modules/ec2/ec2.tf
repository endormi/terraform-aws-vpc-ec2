resource "aws_instance" "pub_ec2" {
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  associate_public_ip_address = true
  subnet_id                   = "${var.pub_sub_id}"
  vpc_security_group_ids      = ["${var.pub_sg_id}"]
  key_name                    = "${var.key_name}"

  provisioner "file" {
    source      = "./${var.key_name}.pem"
    destination = "/home/ec2-user/${var.key_name}.pem"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("${var.key_name}.pem")
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = ["chmod 400 ~/${var.key_name}.pem"]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("${var.key_name}.pem")
      host        = self.public_ip
    }
  }

  tags = {
    Name        = "${var.project_name}-pub-ec2"
    Environment = "${var.environment}-pub-ec2"
  }
}

resource "aws_instance" "priv_ec2" {
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  associate_public_ip_address = false
  subnet_id                   = "${var.priv_sub_id}"
  vpc_security_group_ids      = ["${var.priv_sg_id}"]
  key_name                    = "${var.key_name}"

  tags = {
    Name        = "${var.project_name}-priv-ec2"
    Environment = "${var.environment}-priv-ec2"
  }
}
