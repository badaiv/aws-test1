module "ec2_app" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = var.app_name
  instance_count         = 1

  ami                    = "ami-05105e44227712eb6" // Nginx from Bitnami https://aws.amazon.com/marketplace/pp/prodview-lzep7hqg45g7k
  instance_type          = "t2.micro"
  key_name               = var.ec2_key_name
  monitoring             = true
  vpc_security_group_ids = [ module.vpc.default_security_group_id ] // todo create separate SG
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = var.env_name
  }
}