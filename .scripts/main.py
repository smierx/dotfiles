import typer
import json
import os
app = typer.Typer()

alias_path = "~/smierx/alias/"

@app.command()
def get_alias(path:str):
    files = [file for file in os.listdir(os.path.expanduser(alias_path)) 
            if file != "main"
            and not os.path.isdir(os.path.expanduser(alias_path+file))]

    if not path in files:
        print("Keine Passende Alias Datei!")
        print("Möglich sind:")
        print(json.dumps(files,indent=4))

    with open(os.path.expanduser(alias_path+path),"r") as file:
        data = file.readlines()

    for line in data:
        if line.startswith("alias "):
            print(line.split("alias ")[1].split("\n")[0])

@app.command()
def list_leader():
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

if __name__ == "__main__":
    app()
