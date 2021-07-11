module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.aws_zones
  private_subnets = [
    cidrsubnet(var.vpc_cidr, 8, 1),
    cidrsubnet(var.vpc_cidr, 8, 2),
  ]
  public_subnets  = [
    cidrsubnet(var.vpc_cidr, 8, 101),
    cidrsubnet(var.vpc_cidr, 8, 102),
  ]

  enable_nat_gateway = true

  manage_default_security_group  = true
  default_security_group_ingress = [
    {
      description = "allow 80 ingress from internet"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      description = "allow 443 ingress from internet"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      description = "allow 22 ingress from internet"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  default_security_group_egress = [
    {
      description = "allow allow all egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = var.env_name
  }
}