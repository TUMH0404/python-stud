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

├─ start_python_history.bat # Windows起動用

├─ history_repl.py # 履歴保存ロジック

├─ requirements.txt # 必要ライブラリ

└─ start_python_history.command # mac起動用

---

## 🚀 使い方

### 📥 ダウンロード方法（GitHub）

本プロジェクトは GitHub から取得できます。

---

### ✔ 方法①（推奨：git）

```bash
git clone https://github.com/TUMH0404/python-stud.git
```
取得後
```bash
cd python-stud
```

macの場合

ターミナル起動後、以下を実行する
```bash
chmod +x start_python_history.command
./start_python_history.command
```



入力終了後、exit()で保存される。
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
- Python 3.10〜3.14 で動作確認済み

### ✔ Pythonのインストール（Windows）

以下のリンクからPythonをインストールしてください：

👉 https://www.python.org/ftp/python/3.14.4/python-3.14.4-amd64.exe


---

### ✔ Pythonの確認方法

#### Windows

```powershell
python --version
```

### ✔ Visual Studio Code(Windows)

以下のリンクからインストール（いずれ使用する）

https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user
