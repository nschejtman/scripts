import os
import math
import argparse
import sys
import shutil

parser = argparse.ArgumentParser(description='Create buckets from files')
help_ = {
    'd': 'Directory which\'s contents will be bucketed',
    'p': 'Prefix for each bucket',
    's': 'Sorting criteria for each bucket',
    'n': 'Bucket size',
    'c': 'Copy files'
}

sorting_criteria = {
    'alphabetical': (lambda x: x, False),
    'reverse_alphabetical': (lambda x: x, True),
    'none': None
}

parser.add_argument('-d', '--dir', default=os.getcwd(), type=str, help=help_['d'], dest='path')
parser.add_argument('-p', '--prefix', default='b_', type=str, help=help_['p'], dest='bucket_prefix')
parser.add_argument('-s', '--sort', default='none', type=str, choices=sorting_criteria.keys(), help=help_['s'],
                    dest='sort_criteria')
parser.add_argument('-n', '--size', default=100, type=int, help=help_['n'], dest='bucket_size')
parser.add_argument('-c', '--copy', action='store_true', help=help_['c'], dest="copy")

args = parser.parse_args(sys.argv[1:])
files = os.listdir(args.path)

if args.sort_criteria != 'none':
    sorting_args = sorting_criteria[args.sort_criteria]
    files.sort(key=sorting_args[0], reverse=sorting_args[1])

current_bucket_idx = 0
bucket_idx = 0
current_bucket = args.bucket_prefix + str(bucket_idx)

for f in files:
    base = args.path if args.path[-1] == '/' else args.path + '/'
    if not os.path.exists(base + current_bucket):
        os.makedirs(base + current_bucket)
    if args.copy:
        shutil.copy2(base + f, base + current_bucket)
    else:
        shutil.move(base + f, base + current_bucket)
    current_bucket_idx += 1

    if current_bucket_idx >= args.bucket_size:
        current_bucket_idx = 0
        bucket_idx += 1
        current_bucket = args.bucket_prefix + str(bucket_idx)
