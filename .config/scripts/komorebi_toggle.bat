@echo off
REM Prüfen ob komorebi.exe läuft
tasklist | findstr /i komorebi.exe >nul
if %errorlevel%==0 (
    echo Komorebi läuft – beende Prozesse
    taskkill /f /im komorebi.exe >nul 2>&1
    taskkill /f /im komorebi-bar.exe >nul 2>&1
    taskkill /f /im whkd.exe >nul 2>&1
) else (
    echo Starte Komorebi mit Bar und whkd
    start "" "komorebic" start --whkd --bar
)
