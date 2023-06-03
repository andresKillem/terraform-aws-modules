# VPC Design Patterns

## Multi-Tier Architecture

This VPC module implements a three-tier architecture:

### Public Tier
- Internet-facing resources
- Load balancers
- NAT Gateways
- Bastion hosts

### Private Tier
- Application servers
- EKS worker nodes
- Application load balancers (internal)

### Database Tier
- RDS instances
- ElastiCache clusters
- Isolated from direct internet access

## High Availability

- Multi-AZ deployment across 3 availability zones
- Redundant NAT Gateways (one per AZ)
- Cross-AZ load balancing

## Security

- VPC Flow Logs enabled by default
- Network ACLs for subnet-level security
- Security groups for instance-level control
- Private subnets with no direct internet access

## Cost Optimization

- Single NAT Gateway option for dev/test environments
- VPC endpoints for AWS services to avoid data transfer costs
- Appropriate subnet sizing to avoid IP waste
