variable "env_name" {
  description = "Name for environment. Will be used in tags"
  type    = string
  default = "dev"
}

variable "app_name" {
  description = "Application name. Will be used in naming"
  type    = string
  default = "my-app"
}

variable "domain_name" {
  description = "Registered domain name in Route 53"
  type    = string
  default = "example.com"
}

variable "vpc_name" {
  description = "VPC name"
  type    = string
  default = "my-vpc"
}

variable "aws_zones" {
  description = "List of zones where resources will be created."
  type = list(string)
  default = ["us-west-2a", "us-west-2b"]
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  type    = string
  default = "10.0.0.0/16"
}

variable "ec2_key_name" {
  description = "SSH key which will be used to access VM. Should be exist in AWS account"
  default = "keyname"
}
