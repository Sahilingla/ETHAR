@echo off
REM TeamFlow Setup Script for Windows

echo.
echo 🚀 TeamFlow - Team Task Manager Setup
echo ======================================
echo.

REM Check Node.js
echo Checking Node.js...
node -v >nul 2>&1
if errorlevel 1 (
    echo ❌ Node.js is not installed. Please install Node.js 18+
    pause
    exit /b 1
)
for /f "tokens=*" %%i in ('node -v') do set NODE_VERSION=%%i
echo ✅ Node.js %NODE_VERSION%

REM Check npm
echo Checking npm...
npm -v >nul 2>&1
if errorlevel 1 (
    echo ❌ npm is not installed
    pause
    exit /b 1
)
for /f "tokens=*" %%i in ('npm -v') do set NPM_VERSION=%%i
echo ✅ npm %NPM_VERSION%

REM Install backend
echo.
echo Setting up backend...
cd backend
if not exist .env (
    echo Creating .env file from .env.example...
    copy .env.example .env
    echo ✅ Created .env (please update with your MongoDB URI)
)
call npm install
if errorlevel 1 (
    echo ❌ Failed to install backend dependencies
    pause
    exit /b 1
)
echo ✅ Backend dependencies installed
cd ..

REM Install frontend
echo.
echo Setting up frontend...
cd frontend
if not exist .env (
    echo Creating .env file from .env.example...
    copy .env.example .env
    echo ✅ Created .env
)
call npm install
if errorlevel 1 (
    echo ❌ Failed to install frontend dependencies
    pause
    exit /b 1
)
echo ✅ Frontend dependencies installed
cd ..

echo.
echo ✅ Setup complete!
echo.
echo Next steps:
echo 1. Update backend\.env with your MongoDB URI
echo 2. Run backend: cd backend ^&^& npm run dev
echo 3. Run frontend: cd frontend ^&^& npm run dev
echo 4. Open http://localhost:5173
echo.
echo Happy coding! 🎉
echo.
pause
