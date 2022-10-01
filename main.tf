# PROVIDER
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# REGION
provider "aws" {
  region = var.aws_region
}

# MODULES
module "vpc" {
  source = "./module_01"
}

module "rds" {
  source = "./module_02"
  sn_priv_1a_id = module.vpc.sn_priv_1a_id 
  sn_priv_1c_id = module.vpc.sn_priv_1c_id 
  sg_priv_id = module.ec2.sg_priv_id 
}

module "ec2" {
  source = "./module_03"
  vpc_id = module.vpc.vpc_id
  sn_pub_1a_id = module.vpc.sn_pub_1a_id
  sn_pub_1c_id = module.vpc.sn_pub_1c_id 
  rds_endpoint = module.rds.rds_endpoint
}
