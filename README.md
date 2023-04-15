# Terraform AWS Modules

Production-ready Terraform modules for AWS infrastructure. Built with security, scalability, and cost-optimization in mind.

## Architecture Philosophy

These modules follow AWS Well-Architected Framework principles and are designed for enterprise environments requiring high availability, security, and compliance.

## Available Modules

### Networking
- `vpc` - Multi-AZ VPC with public/private subnets, NAT gateways, and VPC endpoints
- `transit-gateway` - Hub and spoke networking for multi-account architectures
- `cloudfront-waf` - CloudFront distribution with WAF and security headers

### Compute
- `eks-cluster` - Production-grade EKS with IRSA, managed node groups, and Fargate profiles
- `ecs-fargate` - Serverless container platform with Service Connect and ALB integration
- `autoscaling-group` - EC2 auto-scaling with mixed instances and spot integration

### Data & Storage
- `rds-postgres` - High-availability RDS PostgreSQL with read replicas and automated backups
- `s3-secure-bucket` - Encrypted S3 buckets with versioning, lifecycle policies, and access logging
- `elasticache-redis` - Redis cluster with multi-AZ failover

### Security & Compliance
- `iam-roles` - Least-privilege IAM roles and policies with boundary policies
- `kms-encryption` - KMS key management with automatic rotation
- `security-hub` - AWS Security Hub with custom security standards

### Observability
- `cloudwatch-alarms` - Comprehensive monitoring and alerting
- `xray-tracing` - Distributed tracing for microservices

## Usage Example

```hcl
module "vpc" {
  source = "./modules/vpc"

  environment         = "production"
  vpc_cidr           = "10.0.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

  enable_nat_gateway   = true
  enable_vpc_endpoints = true
  enable_flow_logs     = true

  tags = {
    ManagedBy = "Terraform"
    Owner     = "DevOps Team"
  }
}
```

## Design Principles

1. **Security First**: All modules implement encryption at rest and in transit
2. **High Availability**: Multi-AZ deployments by default
3. **Cost Optimized**: Leverage spot instances, reserved capacity, and savings plans
4. **Compliance Ready**: Support for HIPAA, PCI-DSS, SOC2 requirements
5. **GitOps Friendly**: Designed for automated CI/CD pipelines

## Module Standards

Each module includes:
- Comprehensive input validation
- Detailed outputs for downstream dependencies
- Example configurations
- Security best practices
- Cost optimization recommendations

## Author

Built by Andrés Muñoz - Principal DevOps Architect
- 10+ years experience with AWS and Infrastructure as Code
- AWS Solutions Architect Professional certified
- Specialized in FinTech and healthcare compliance

## License

MIT License - See LICENSE file for details
