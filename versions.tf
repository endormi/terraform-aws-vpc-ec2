terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 3.71"
    }
    http = {
      source = "hashicorp/http"
      version = ">= 2.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = ">= 3.0"
    }
  }
}
