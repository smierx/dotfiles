import os
import sys
import json


if len(sys.argv) == 1:
    exit(0)

alias_path = "~/.alias/"

files = [file for file in os.listdir(os.path.expanduser(alias_path)) if file != "main" and not os.path.isdir(os.path.expanduser(alias_path+file))]

if not sys.argv[1] in files:
    print("Keine Passende Alias Datei!")
    print("Möglich sind:")
    print(json.dumps(files,indent=4))

    exit(0)

with open(os.path.expanduser(alias_path+sys.argv[1]),"r") as file:
    data = file.readlines()

for line in data:
    if line.startswith("alias "):
        print(line.split("alias ")[1].split("\n")[0])
