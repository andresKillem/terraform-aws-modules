terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "../../modules/vpc"

  environment = "production"
  vpc_cidr    = "10.0.0.0/16"
  az_count    = 3

  enable_nat_gateway   = true
  single_nat_gateway   = false
  enable_flow_logs     = true

  tags = {
    Environment = "production"
    ManagedBy   = "Terraform"
    Project     = "infrastructure"
  }
}

module "eks" {
  source = "../../modules/eks-cluster"

  cluster_name       = "production-eks"
  kubernetes_version = "1.28"

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  public_subnet_ids  = module.vpc.public_subnet_ids

  node_groups = {
    general = {
      instance_types = ["t3.large"]
      capacity_type  = "ON_DEMAND"
      disk_size      = 50
      desired_size   = 3
      max_size       = 6
      min_size       = 2
      labels = {
        workload = "general"
      }
    }
    spot = {
      instance_types = ["t3.large", "t3a.large"]
      capacity_type  = "SPOT"
      disk_size      = 50
      desired_size   = 2
      max_size       = 10
      min_size       = 0
      labels = {
        workload = "batch"
      }
    }
  }

  tags = {
    Environment = "production"
    ManagedBy   = "Terraform"
  }
}
