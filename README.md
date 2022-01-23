# terraform-aws-vpc-ec2-sg

**NOTE**: This is not free. There are costs when running this project.

Creates a VPC, two subnets (public and private), two route tables, internet and nat gateway, security group, two ec2 instances (public and private) and a SSH key.

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
