@echo off
title 🌀 Pulling Latest Changes
:: Set console colors (black background, bright white text)
color 0F
echo.
echo ========================================
echo   Pulling latest changes from GitHub...
echo ========================================
echo.

cd /d "%~dp0"
git pull origin main

if %errorlevel% neq 0 (
    echo.
    echo [31m❌ Something went wrong while pulling changes.[0m
    echo Please check your internet connection or contact David <3.
    echo.
    pause
    exit /b
)

echo.
echo [32m✅ All files are now up to date with GitHub.[0m
echo You can safely add, edit, or remove files now.
echo.
pause
