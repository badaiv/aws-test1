# aws-test1
Some stuff to play with AWS and Python

### What we have here
`terraform` - contains code to create resources in AWS

`python`- scripts to get info from AWS

### Requirements
You should have installed:
* python >= 3.6 [download](https://www.python.org/downloads/)
* pip
* terraform >= 1.0

### How to use it
Go to subfolders for further instructions

### Configuration
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
