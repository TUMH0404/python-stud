📘 Python対話履歴 自動保存環境（Windows / Mac対応）
🎯 概要

本プロジェクトは、Python対話モード（>>>）で入力したコマンド履歴を
自動でファイル保存する環境を構築するものです。

仮想環境の自動作成
必要ライブラリの自動インストール
Python起動時の履歴取得
毎回別ファイルで履歴保存

👉 授業・演習・ログ提出用途に最適です

📁 フォルダ構成
sample-stud
├─ start_python_history.bat        # Windows起動用
├─ start_python_history.command    # Mac起動用
├─ startup.py                      # 履歴保存ロジック
├─ requirements.txt                # 必要ライブラリ
└─ env/                            # 仮想環境（自動生成）
🚀 使い方
▶ Windows
zipを解凍
start_python_history.bat をダブルクリック
新しいコマンドプロンプトが開く
Pythonが起動
>>> a = 10
>>> b = 20
>>> a + b
exit() で終了

👉 同じフォルダに履歴ファイルが生成されます
