#!/usr/bin/env python

import boto3
import argparse
import common

resources_per_page = 50
tag_filters = []


def input_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("-r", "--region",
                        default='us-west-2',
                        help="AWS region to check")
    return parser.parse_args()


def main():
    args = input_args()
    restag = boto3.client('resourcegroupstaggingapi', region_name=args.region)
    response = restag.get_resources(
        ResourcesPerPage=resources_per_page,
        TagFilters=tag_filters
    )
    common.pretty(response)
    while 'PaginationToken' in response and response['PaginationToken']:
        token = response['PaginationToken']
        response = restag.get_resources(
            ResourcesPerPage=resources_per_page, PaginationToken=token)
        common.pretty(response)


if __name__ == '__main__':
    main()
