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
└─ env/ # 仮想環境（自動生成）

---

## 🚀 使い方

### ▶ Windows

1. https://github.com/TUMH0404/python-stud-win.git
2. python-stud-winにある`start_python_history.bat` をダブルクリック  
3. 新しいコマンドプロンプトが開く  
4. Pythonが起動  

```python
>>> a = 10
>>> b = 20
>>> a + b
```


---
### ✔ Pythonのインストール

Pythonがインストールされている必要があります。

#### 推奨バージョン
- **Python 3.11（推奨）**
- Python 3.10〜3.14 で動作確認済み


---

### ✔ Pythonの確認方法

#### Windows

```powershell
python --version
```
