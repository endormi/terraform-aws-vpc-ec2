terraform {
  // WIP
  // required_version = ">= "

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 3.71"
    }
    http = {
      source = "hashicorp/http"
      version = ">= 2.1"
    }
  }
}
