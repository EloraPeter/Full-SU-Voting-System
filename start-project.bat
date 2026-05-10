@echo off
title SU Voting System 

echo ================================
echo   SU VOTING SYSTEM STARTER
echo ================================
echo.

echo ADMIN LOGIN DETAILS (DEMO ONLY)
echo -------------------------------
echo URL: http://localhost:8000/pages/auth/login.html
echo Matric Number: cmp20000001
echo Password: poiuytrewq
echo -------------------------------
echo.

echo ================================
echo  Starting System...
echo ================================
echo.

:: ================================
:: START BACKEND
:: ================================
echo [1/2] Starting Backend Server...
start "Backend Server" cmd /k "cd SU-voting-backend-master && node server.js"

timeout /t 3 >nul

:: ================================
:: START FRONTEND
:: ================================
echo [2/2] Starting Frontend Server...
start "Frontend Server" cmd /k "cd SU-voting-frontend-master && python -m http.server 8000"

timeout /t 2 >nul

:: ================================
:: OPEN BROWSER
:: ================================
echo Opening browser...
start http://localhost:8000/pages/auth/login.html

echo.
echo ================================
echo  SYSTEM RUNNING SUCCESSFULLY
echo ================================
echo  Backend:  http://localhost:5000
echo  Frontend: http://localhost:8000
echo ================================
echo.
pause