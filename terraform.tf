terraform {

  required_providers {
    aws = {
      acess_key = AKIATU5ZYTMOU3KJ7KN5
      secret_key = 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
      source  = "hashicorp/aws"
      version = "4.11.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.11.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.5.1"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.7.2"
    }
  }
}

data "aws_caller_identity" "current" {} # used for accesing Account ID and ARN

provider "aws" {
  default_tags {
    tags = {
      iac_environment = var.iac_environment_tag
    }
  }
}
