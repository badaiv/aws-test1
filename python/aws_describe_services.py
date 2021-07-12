#!/usr/bin/env python

import boto3
import argparse
import json
import common


def input_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--dict', type=json.loads,
                        help="Pass single dict: {\"ec2\":\"vpcs\"}")
    parser.add_argument('-i', '--input_file',
                        help="Input json file with list of services to get.")
    return parser.parse_args()


def main():
    args = input_args()
    # print single resource type from CLI
    if args.dict:
        for key, val in args.dict.items():
            client = boto3.client(key)
            response = eval("client.describe_{}()".format(val))
            common.pretty(response)
    # print several resource types from file
    if args.input_file:
        data = json.load(open(args.input_file))
        for item in data:
            for key, val in item.items():
                client = boto3.client(key)
                response = eval("client.describe_{}()".format(val))
                common.pretty(response)


if __name__ == '__main__':
    main()
