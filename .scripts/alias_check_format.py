import os

alias_path = "~/.alias/"

files = [file for file in os.listdir(os.path.expanduser(alias_path)) if file != "main"]

for file in files:
    if not os.path.isdir(os.path.expanduser(alias_path+file)):
        with open(os.path.expanduser(alias_path+file),"r") as f:
            data = f.readline()
        if not data.startswith("# Leader:"):
            print(file)
