import sys
import json
import collections
from rich.table import Table
from rich.console import Console


if __name__=="__main__":
    result = collections.defaultdict(list)
    DATA = sys.argv[1]
    data = json.loads(DATA)
    tmp = [result[x["module"]].append(x) for x in data]
    data = list(result.values())
    console = Console()
    for module in data:
        sorted_module = sorted(module,key=lambda d: d["line"])
        table = Table(title=module[0]["module"])
        table.add_column("Type",justify="right",style="cyan")
        table.add_column("Kind",style="magenta",no_wrap=True)
        table.add_column("Line",style="green",no_wrap=True)
        table.add_column("ID",style="cyan")
        table.add_column("Message",style="magenta",no_wrap=True)
        for entry in sorted_module:
            if entry["type"] in ["error","convention","warning","refactor"]:
                t = entry["type"][0]
            else:
                t = entry["type"]
            table.add_row(
                t,
                entry["symbol"],
                str(entry["line"]),
                entry["message-id"],
                entry["message"]
            )
        console.print(table)
