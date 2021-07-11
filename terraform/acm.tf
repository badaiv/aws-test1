module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 3.0"

  domain_name = data.aws_route53_zone.selected.name
  zone_id     = data.aws_route53_zone.selected.zone_id

  subject_alternative_names = [
    "*.${var.domain_name}",
  ]

  wait_for_validation = true

  tags = {
    Name        = var.domain_name
    Terraform   = "true"
    Environment = var.env_name
  }
}

data "aws_route53_zone" "selected" {
  name = "${var.domain_name}."
}