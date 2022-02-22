@REM Disable echo
@echo off

@REM Wait for curl
Setlocal EnableDelayedExpansion

@REM Clear console to make things less ambiguous
@cls

@REM Create a folder for downloads to be stored, delete it if it already exists
IF EXIST tmp (
    rmdir /s /q tmp
)

mkdir tmp
echo Temporary folder created.

@REM Check that git is installed
git --version >nul && (
    echo Git is installed
) || (
    echo Git is not installed, Downloading...
    start /B /w curl -L "https://github.com/git-for-windows/git/releases/download/v2.35.1.windows.2/Git-2.35.1.2-64-bit.exe" -o tmp/git.exe
    echo Git downloaded. Installing...
    start /w tmp\git.exe
)

@REM Check that node.js is installed
node --version >nul && (
    echo Node.js is installed
) || (
    echo Node.js is not installed. Downloading...
    start /B /w curl -L "https://nodejs.org/dist/v8.11.3/node-v8.11.3-x64.msi" -o tmp/node.msi
    echo Node.js downloaded. Installing...
    start /w tmp\node.msi
)

@REM Check that python is installed
python --version >nul && (
    echo Python is installed
) || (
    echo Python is not installed. Downloading...
    start /B /w curl -L "https://www.python.org/ftp/python/3.10.2/python-3.10.2-amd64.exe" -o ./tmp/python.exe
    echo Python downloaded. Installing...
    call tmp\python.exe
)

echo All done, head into the notebooks folder to get started
pause