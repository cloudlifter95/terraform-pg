terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  alias   = "jakarta"
  region  = "ap-southeast-3"
  profile = "jakarta"
}

provider "aws" {
  alias   = "frankfurt"
  region  = "eu-central-1"
  profile = "cloud9ws"
}


