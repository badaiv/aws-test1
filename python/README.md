# aws-test1
Some stuff to play with AWS and Python

## What we have here
`aws_get_all_resoureces.py` - Will get all resources which were ever tagged. The best practice to put tags an all resources, so we assume that we will get all resources. To get all other resources need further investigation.

`aws_describe_services.py` - WIll get all resources of the given type. `input.json` as example.

## Requirements
You should have installed:
* python >= 3.6 [download](https://www.python.org/downloads/)
* pip

## How to use it
To setup environment. This will setup pip packages and load pipenv for Python
```
./start_env.sh
```
To get help
```
./scrit_name.py -h 
```
To run
```
./scrit_name.py
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
