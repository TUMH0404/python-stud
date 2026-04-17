import os
import code
from datetime import datetime

base_dir = os.path.dirname(os.path.abspath(__file__))
ts = datetime.now().strftime("%Y%m%d_%H%M%S")
histfile = os.path.join(base_dir, f"提出ファイル_python_history_{ts}.txt")

banner = "\n".join([
    "======================================",
    " Python履歴保存モード（今回入力分のみ）",
    f" 保存先: {histfile}",
    " 終了: exit() または Ctrl+Z + Enter",
    "======================================",
])

class LoggingConsole(code.InteractiveConsole):
    def __init__(self, filename, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.filename = filename
        self.lines = []

    def raw_input(self, prompt=""):
        line = input(prompt)
        s = line.strip()
        if s and s not in {"exit()", "quit()", "exit", "quit"}:
            self.lines.append(line)
        return line

    def save(self):
        with open(self.filename, "w", encoding="utf-8") as f:
            for line in self.lines:
                f.write(line + "\n")

console = LoggingConsole(histfile)
try:
    console.interact(banner=banner)
finally:
    console.save()
    print(f"\n今回の履歴を保存しました: {histfile}")
    
