import glob
import json
import re
import os
import sys
import concurrent
import numpy as np
from itertools import repeat,chain

metadata_dir = '<PATH TO USER METADATA>'
metadata_dir += '/*.json'

#fields from below to copy from json files and keep in memory
fields = ['published_datetime','id','author','comments','liked_by','makes', 'remixed_from', 'customizer', 'description','category', 'title', 'tags']

#Takes in a filepath and a list of fields within the json to write to a dictionary
def get_metadata(filepath,fields):
    try:
        data = json.loads(open(filepath).read())
        return_data = []
        for item in data:
            return_data.append({field:value for field,value in item.items() if True or field in fields})
        return return_data
    except:
        return []

files = glob.glob(metadata_dir) 
print("Reading From {} Files...".format(len(files)))
udata = [[] for i in range(len(files))]
#multiprocess reading in files
with concurrent.futures.ProcessPoolExecutor() as executor: 
    for i,udata_part in enumerate(zip(files,executor.map(get_metadata,files,repeat(fields)))):
        _,udata[i] = udata_part
udata = list(chain.from_iterable(udata)) #flatten list of list of dictionaries to list of dictionaries
print("{} Users Read".format(len(udata)))
