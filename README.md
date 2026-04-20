# 📘 Python対話履歴 自動保存環境（Windows）


## 🎯 概要
本プロジェクトは、Python対話モード（`>>>`）で入力したコマンド履歴を  
**自動でファイル保存する環境**を構築するものです。

- 仮想環境の自動作成
- 必要ライブラリの自動インストール
- Python起動時の履歴取得
- 毎回別ファイルで履歴保存

👉 授業・演習・ログ提出用途に最適です

---

## 📁 フォルダ構成
sample-stud

├─ README.md

├─ history_repl.py # 履歴保存ロジック

├─ requirements.txt # 必要ライブラリ

└─ start_python_history.command # mac起動用

---

## 🚀 使い方

### 📥 ダウンロード方法

#### ✔ 方法①（推奨：git）

```bash
git clone https://github.com/TUMH0404/python-stud.git
```
取得後
```bash
cd python-stud
```

##### winの場合
powershell起動後、以下を実行する
```bash
./start_python_history.bat
```

##### macの場合
ターミナル起動後、以下を実行する
```bash
chmod +x start_python_history.command
./start_python_history.command  # or source ./start_python_history.command
```
#### ✔ 方法②（zip）
##### winの場合
```powershell
cd $HOME
Remove-Item "python-stud-main", "main.zip" -Recurse -Force -ErrorAction SilentlyContinue
Invoke-WebRequest -Uri "https://github.com/TUMH0404/python-stud/archive/refs/heads/main.zip" -OutFile "main.zip"
Expand-Archive main.zip -DestinationPath .
cd ./python-stud-main
./start_python_history.bat
```
##### macの場合
```bash
cd $HOME
rm -rf main.zip python-stud-main
curl -L -O https://github.com/TUMH0404/python-stud/archive/refs/heads/main.zip
unzip main.zip
cd python-stud-main
chmod +x start_python_history.command
./start_python_history.command  # or source ./start_python_history.command
```


`>>>`が表示されればおそらく成功！

---

#### ✔ 演習課題に取り組む
課題の過程が記録される。

課題が終了したら、必ず、`exit()` または `quit()`で終了する。

exit()で保存される。
```python
>>> a = 10
>>> b = 20
>>> a + b
>>> exit() #or quit() 
```


---
### ✔ Pythonのインストール

Pythonがインストールされている必要があります。

#### 推奨バージョン
- **Python 3.11（推奨）**
- Python 3.9〜3.14 で動作確認済み


以下のリンクでインストーラーがダウンロードされるので、ダブルクリックしてインストールしてください。

win

👉 https://www.python.org/ftp/python/3.14.4/python-3.14.4-amd64.exe

Mac

👉 https://www.python.org/downloads/release/python-3144/

---

#### Pythonの確認方法

```powershell
python --version
```

### ✔ Visual Studio Code

以下のリンクでインストーラーがダウンロードされるので、ダブルクリックしてインストールしてください。

win

👉 https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user

mac

👉 https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal-dmg
