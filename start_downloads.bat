@echo off

echo 古いフォルダを削除します...
if exist "python-stud-main" (
    rmdir /s /q "python-stud-main"
)

echo ダウンロードします...
curl -L -o main.zip https://github.com/TUMH0404/python-stud/archive/refs/heads/main.zip

echo 解凍します...
powershell -Command "Expand-Archive main.zip"

cd python-stud-main
start_python_history.bat
