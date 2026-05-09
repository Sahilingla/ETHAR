# 📋 TeamFlow – Team Task Manager

A full-stack, production-ready team task management application built with **React**, **Node.js**, **Express**, and **MongoDB**. Perfect for teams to collaborate, organize tasks, and track project progress in real-time.

**Status:** ✅ Production Ready | 🚀 Deploy on Railway

---

## ✨ Key Features

- ✅ **Team Management** — Create teams, manage members, assign roles (Admin, Member)
- ✅ **Project & Task Tracking** — Organize work into projects with categorized tasks
- ✅ **Real-time Updates** — See changes instantly across the team
- ✅ **Task Priorities** — Set high/medium/low priorities and due dates
- ✅ **Analytics Dashboard** — Track completion rates and team productivity
- ✅ **Secure Authentication** — JWT-based login with secure password hashing
- ✅ **Responsive Design** — Works seamlessly on desktop and mobile
- ✅ **Production-Ready** — Full deployment ready on Railway + MongoDB Atlas

---

## 🚀 Quick Start (5 minutes)

### Prerequisites
- Node.js 18+ ([Download](https://nodejs.org))
- MongoDB Atlas account ([Free tier](https://cloud.mongodb.com))
- Git

### Setup

**Backend:**
```bash
cd backend
npm install
cp .env.example .env
# Edit .env and add your MongoDB connection string
npm run dev
```

**Frontend (new terminal):**
```bash
cd frontend
npm install
npm run dev
```

Open http://localhost:5173

### Seed Demo Data
```bash
cd backend
node seed.js
```

**Demo Accounts:**
- Email: `admin@teamflow.io` / Password: `admin123`
- Email: `member@teamflow.io` / Password: `member123`

---

## 📦 Tech Stack

| Layer | Technology |
|-------|------------|
| **Frontend** | React 18, React Router, Tailwind CSS, Zustand, TanStack Query |
| **Backend** | Node.js, Express, MongoDB, Mongoose, JWT |
| **Deployment** | Railway, MongoDB Atlas |
| **Security** | bcryptjs, Helmet.js, CORS, Rate Limiting |

---

## 🌐 Deploy to Railway (Production)

**[See Full Deployment Guide →](./DEPLOY.md)** (5-10 minutes)

### Quick Steps:
1. Push to GitHub
2. Connect Railway to your repo
3. Set environment variables
4. Done! Auto-deploys on every push

**Environment Variables:**
```
Backend: MONGODB_URI, JWT_SECRET, NODE_ENV, FRONTEND_URL
Frontend: VITE_API_URL
```

See [DEPLOY.md](./DEPLOY.md) for detailed instructions.

---

## 📁 Project Structure

```
task-manager/
├── backend/
│   ├── models/           # Database schemas (User, Project, Task)
│   ├── routes/           # API endpoints
│   ├── middleware/       # Auth & security middleware
│   ├── server.js         # Express app
│   └── seed.js           # Demo data seeding
│
└── frontend/
    ├── src/
    │   ├── components/   # Reusable UI components
    │   ├── pages/        # Page components (Dashboard, Tasks, etc)
    │   ├── context/      # State management (Zustand)
    │   └── utils/        # API client & helpers
    └── public/           # Static assets
```

---

## 🔑 API Endpoints

**Authentication**
- `POST /api/auth/register` — Register new user
- `POST /api/auth/login` — Login
- `GET /api/auth/me` — Get current user

**Projects**
- `GET /api/projects` — List all projects
- `POST /api/projects` — Create project
- `PUT /api/projects/:id` — Update project
- `DELETE /api/projects/:id` — Delete project

**Tasks**
- `GET /api/tasks` — List tasks
- `POST /api/tasks` — Create task
- `PUT /api/tasks/:id` — Update task
- `DELETE /api/tasks/:id` — Delete task

**Analytics**
- `GET /api/analytics/dashboard` — Get stats & charts

---

## 🏗️ Architecture

- **MVC Pattern** — Clean separation of concerns
- **RESTful API** — Standard HTTP conventions
- **JWT Auth** — Secure token-based authentication
- **State Management** — Zustand for lightweight client state
- **Component-based UI** — Reusable React components
- **Error Handling** — Comprehensive middleware
- **Security** — Password hashing, CORS, rate limiting

---

## 🔒 Security

- ✅ Password hashing (bcryptjs)
- ✅ JWT token authentication
- ✅ CORS protection
- ✅ Rate limiting (15 req/min per IP)
- ✅ Input validation (server-side)
- ✅ Helmet.js security headers
- ✅ Environment variables (no secrets in code)

---

## 📈 Performance

- Lazy-loaded React components
- API response caching (TanStack Query)
- Database query optimization
- Gzip compression enabled
- Mobile-responsive design

---

## 📚 Documentation

| Document | Purpose |
|----------|---------|
| [DEPLOY.md](./DEPLOY.md) | Railway deployment guide |
| [DEPLOYMENT_CHECKLIST.md](./DEPLOYMENT_CHECKLIST.md) | Pre-deployment verification |
| [CONTRIBUTING.md](./CONTRIBUTING.md) | How to contribute |
| [LICENSE](./LICENSE) | MIT License |

---

## 💡 Future Enhancements

- Real-time collaboration (WebSockets)
- Email notifications
- Mobile app (React Native)
- Dark mode
- Calendar view
- Export to PDF
- Multi-language support

---

## 🤝 Contributing

We welcome contributions! See [CONTRIBUTING.md](./CONTRIBUTING.md)

1. Fork the repository
2. Create feature branch: `git checkout -b feature/amazing-feature`
3. Commit: `git commit -m 'Add: amazing feature'`
4. Push: `git push origin feature/amazing-feature`
5. Open a Pull Request

---

## 🆘 Troubleshooting

**Cannot connect to MongoDB:**
- Verify connection string in `.env`
- Check MongoDB credentials
- Ensure IP whitelist is set to `0.0.0.0/0`

**Frontend shows "Cannot connect to API":**
- Check `VITE_API_URL` in frontend `.env`
- Ensure backend is running
- Verify CORS is configured

**Build fails:**
- Delete `node_modules` and run `npm install`
- Clear npm cache: `npm cache clean --force`
- Check Node.js version: `node -v` (should be 18+)

See [DEPLOY.md](./DEPLOY.md) for more help.

---

## 📄 License

MIT License - See [LICENSE](./LICENSE)

---

## 👤 Author

**Sahil Singla**

- GitHub: [@Sahilingla](https://github.com/Sahilingla)
- Repository: [TeamFlow](https://github.com/Sahilingla/ETHAR)

---

## 🎯 Live Demo

Coming soon on Railway! 🚀

Follow [DEPLOY.md](./DEPLOY.md) to deploy your own instance.

---

**Made with ❤️ for team collaboration**
