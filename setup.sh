#!/bin/bash

# TeamFlow Setup Script

echo "🚀 TeamFlow - Team Task Manager Setup"
echo "======================================"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check Node.js
echo -e "${BLUE}Checking Node.js...${NC}"
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js is not installed. Please install Node.js 18+${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Node.js $(node -v)${NC}"

# Check npm
echo -e "${BLUE}Checking npm...${NC}"
if ! command -v npm &> /dev/null; then
    echo -e "${RED}❌ npm is not installed${NC}"
    exit 1
fi
echo -e "${GREEN}✅ npm $(npm -v)${NC}"

# Install backend
echo -e "${BLUE}\nSetting up backend...${NC}"
cd backend
if [ ! -f .env ]; then
    echo -e "${BLUE}Creating .env file from .env.example...${NC}"
    cp .env.example .env
    echo -e "${GREEN}✅ Created .env (please update with your MongoDB URI)${NC}"
fi
npm install
echo -e "${GREEN}✅ Backend dependencies installed${NC}"
cd ..

# Install frontend
echo -e "${BLUE}Setting up frontend...${NC}"
cd frontend
if [ ! -f .env ]; then
    echo -e "${BLUE}Creating .env file from .env.example...${NC}"
    cp .env.example .env
    echo -e "${GREEN}✅ Created .env${NC}"
fi
npm install
echo -e "${GREEN}✅ Frontend dependencies installed${NC}"
cd ..

echo -e "${GREEN}\n✅ Setup complete!${NC}"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo "1. Update backend/.env with your MongoDB URI"
echo "2. Run backend: cd backend && npm run dev"
echo "3. Run frontend: cd frontend && npm run dev"
echo "4. Open http://localhost:5173"
echo ""
echo -e "${GREEN}Happy coding! 🎉${NC}"
