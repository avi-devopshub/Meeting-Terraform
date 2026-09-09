terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.63.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  profile = "dev"
}

terraform {
  #s3 lockfile
    backend "s3" {
        bucket = "s3-backend-090926"
        region = "ap-south-1"
        shared_credentials_files = ["/root/.aws/credentials"]
        profile = "dev"
        key = "terraform.tfstate"
        use_lockfile = true
    }
}