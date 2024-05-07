import os
import json

alias_path = "~/.alias/"

files = [file for file in os.listdir(os.path.expanduser(alias_path)) if file != "main"]
data = {}
for file in files:
    if not os.path.isdir(os.path.expanduser(alias_path+file)):
        with open(os.path.expanduser(alias_path+file),"r") as f:
            tmp_data = f.readline()
        leader = tmp_data.split("# Leader: ")[1].split("\n")[0]
        if leader in data.keys():
            print("Doppelte Leader!")
            print(file)
            print(data[leader])
            data[leader] = [data[leader],file]
        else:
            data[leader] = file

sorted_data = {k: data[k] for k in sorted(data)}

print(json.dumps(sorted_data,indent=4))
