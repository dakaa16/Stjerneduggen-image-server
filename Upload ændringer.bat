@echo off
title 🚀 Uploading Your Changes
color 0F
echo.
echo ========================================
echo   Preparing to upload your changes...
echo ========================================
echo.

cd /d "%~dp0"

:: Check if there are any changes
for /f %%i in ('git status --porcelain ^| find /c /v ""') do set COUNT=%%i

if "%COUNT%"=="0" (
    echo.
    echo [33mℹ️  No changes detected.[0m
    echo Everything is already up to date!
    echo.
    pause
    exit /b
)

echo.
echo The following files have been added, changed, or deleted:
echo --------------------------------------------------------
git status --short
echo --------------------------------------------------------
echo.

set /p confirm="Do you want to continue and upload these changes? (Y/N): "
if /I not "%confirm%"=="Y" (
    echo.
    echo [33mUpload cancelled.[0m No changes were made.
    echo.
    pause
    exit /b
)

echo.
echo 📦 Staging all modified, added, and deleted files...
git add -A

echo.
echo 📝 Committing your changes...
git commit -m "Update files"

echo.
echo 🌐 Uploading to GitHub (main branch)...
git push origin main

if %errorlevel% neq 0 (
    echo.
    echo [31m❌ Something went wrong while pushing your changes.[0m
    echo Please check your internet connection or contact David <3.
    echo.
    pause
    exit /b
)

echo.
echo [32m✅ All your changes have been uploaded successfully![0m
echo You can close this window now.
echo.
pause
