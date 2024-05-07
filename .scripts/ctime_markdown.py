import os
import datetime
import json

base_path = '/home/smierx/Nextcloud/Brain/zettel/'

def rec_ctime(file_path:str, data: dict):
    if os.path.isdir(file_path):
        for i in os.listdir(file_path):
            data = rec_ctime(file_path+'/'+i,data)
    elif file_path.endswith(".md"):
        tmp_date = datetime.datetime.fromtimestamp(int(os.path.getctime(file_path))).strftime("%Y-%m-%d")       
        if not tmp_date in data:
            data[tmp_date] = []
        data[tmp_date].append(file_path)
    return data


if __name__=="__main__":
    data = {}
    for i in os.listdir(base_path):
        data = rec_ctime(base_path+'/'+i,data)
    count_data = {}
    for i in data:
        count_data[i] = len(data[i])
    
    counter = 0
    result = dict(sorted(count_data.items()))
    for x in result:
        print(f"{x}: {result[x]}")
        counter = counter + result[x]
    print(f'Gesamt: {counter}')
