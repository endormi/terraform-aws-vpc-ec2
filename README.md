# terraform-aws-vpc-ec2-sg

**NOTE**: This is not free. There are costs when running this project.

Creates a VPC, two subnets (public and private), two route tables, internet and nat gateway, security group, two ec2 instances (public and private) and a SSH key.

Only allows you (your IP) to SSH to the public instance and allows traffic from VPC to SSH to the private instance. Doesn't restrict outbound rules, but you should apply restrictions.

If you want to use a variable, just replace the code `["${jsondecode(data.http.myip.body).ip}/32"]` with `["${var.sg_cidr_blocks_inbound}"]`.

You don't have to SSH into the instance to see that it works. You can also use a reachability analyzer and add the private instance id and internet gateway id.

I could've created multiple public and private subnets, but decided to create one for each. To know how, check this other [project](https://github.com/endormi/terraform-aws-vpc) I made.

I used a lot of variables for this project.

This is the sample `terraform.tfvars` file:

```
project_name                 = ""
region                       = ""
environment                  = ""
vpc_cidr_block               = ""
route_destination_cidr_block = ""
sg_cidr_blocks_inbound       = ""
sg_cidr_blocks_outbound      = ""
pub_subnet_cidr              = ""
priv_subnet_cidr             = ""
pub_zone                     = ""
priv_zone                    = ""

ami                          = ""
instance_type                = ""
```

I used a lot of tags, because it is a good practice to use them. If I were to own 50 ec2 instances, finding the right one would be very hard without tags.

Initialize:

```
terraform init
```

Validate:

```
terraform validate
```

Plan:

```
terraform plan
```

Apply:

```
terraform apply
```
