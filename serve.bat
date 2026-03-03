@echo off
REM Serve the Family Rewards Dashboard on http://localhost:8080
REM Tries Python 3, then Node npx serve as a fallback.

SET PORT=8080
SET DIR=%~dp0

python --version >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo Starting with Python on port %PORT%...
    cd /d "%DIR%" && python serve.py
    GOTO :EOF
)

python3 --version >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo Starting with Python 3 on port %PORT%...
    cd /d "%DIR%" && python3 serve.py
    GOTO :EOF
)

npx --version >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo Starting with npx serve on port %PORT%...
    cd /d "%DIR%" && npx serve -l %PORT%
    GOTO :EOF
)

echo ERROR: No suitable runtime found. Install Python 3 or Node.js.
exit /b 1
