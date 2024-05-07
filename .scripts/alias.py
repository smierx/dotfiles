import os

alias_path = "~/.alias/"

files = [file for file in os.listdir(os.path.expanduser(alias_path)) if file != "main"]

with open(os.path.expanduser(alias_path)+"main","w") as file:
    for f in files:
        if not os.path.isdir(os.path.expanduser(alias_path+f)):
            file.write(f'if [[ -r "{alias_path.replace("~","$HOME")+f}" ]]; then\n')
            file.write(f'  . {alias_path+f}\n')
            file.write(f'fi\n')
