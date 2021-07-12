import json

def pretty(dict):
    for key in dict:
        if key != 'ResponseMetadata' and type(dict[key]) == list:
            print('##############')
            print(key)
            print('##############')
            print(json.dumps(dict[key], sort_keys=True, indent=2))
