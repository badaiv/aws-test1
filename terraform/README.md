# aws-test1
Some stuff to play with AWS and Python

## What we have here
Terraform code that will create:
* VPC
* 2 private subnets
* 2 public subnets
* ALB
* AWS managed certificate
* EC2 instance with nginx to check ALB is working

## Requirements
You should have installed:
* terraform >= 1.0

## How to use it
check following variables in `variables.tf` before applying terraform

variable name | note
--------------|--------------
domain_name| this is domain name that should be registered in your Route53
aws_zones| zones in which resources will be created
vpc_cidr| CIDR for your VPC. subnets will be shifted with 8 bits and 4 subents will be created. Better use /16 for VPC.
ec2_key_name | key name in your account if you want to access ec2 instance. Import or create some.

To create resources
```
terrafrom init
terrafrom apply
```
To destroy resources
```
terrafrom destroy
```
After resources will be created you should be able to see Nginx stub page on adress
```
https://app.${var.domain_name}
```

## Configuration
You should configure authentication to access AWS
```
aws configure
```
Or put you access keys in `~/.aws/credentials`
```
[default]
aws_access_key_id = YOUR_ACCESS_KEY
aws_secret_access_key = YOUR_SECRET_KEY
```
and configure region at `~/.aws/config`
```
[default]
region=us-east-1
```
