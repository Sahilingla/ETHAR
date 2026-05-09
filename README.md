# 📋 TeamFlow – Team Task Manager

A full-stack, production-ready team task management application built with **React**, **Node.js**, **Express**, and **MongoDB**. Perfect for teams to collaborate, organize tasks, and track project progress in real-time.

---

## 📸 Screenshots

### Dashboard & Projects Overview
![Dashboard](./screenshots/01-dashboard.png)
*Main dashboard showing all projects and team tasks at a glance*

### Task Management
![Task Manager](./screenshots/02-tasks.png)
*Create, edit, and organize tasks with priority levels and due dates*

### Project Details
![Project Details](./screenshots/03-project-details.png)
*View detailed project information, team members, and task progress*

### Team Collaboration
![Team View](./screenshots/04-team.png)
*Manage team members and assign roles*

### Analytics & Insights
![Analytics](./screenshots/05-analytics.png)
*Track productivity with task completion analytics and statistics*

---

## ✨ Key Features

- ✅ **Team Management** — Create teams, manage members, assign roles (Admin, Member)
- ✅ **Project & Task Tracking** — Organize work into projects with categorized tasks
- ✅ **Real-time Updates** — See changes instantly across the team
- ✅ **Task Priorities** — Set high/medium/low priorities and due dates
- ✅ **Analytics Dashboard** — Track completion rates and team productivity
- ✅ **Secure Authentication** — JWT-based login with email verification
- ✅ **Responsive Design** — Works seamlessly on desktop and mobile
- ✅ **Production-Ready** — Deployed on Railway with MongoDB Atlas

---

## 🚀 Quick Start

### Prerequisites
- Node.js 18+
- MongoDB Atlas account (or local MongoDB)
- Git

### Automated Setup (Recommended)

**Windows:**
```bash
setup.bat
```

**macOS/Linux:**
```bash
bash setup.sh
```

### Manual Setup

#### Backend
```bash
cd backend
npm install
cp .env.example .env
# Fill in your MONGODB_URI and JWT_SECRET in .env
npm run dev
```

#### Seed Demo Data
```bash
cd backend
node seed.js
```

Demo accounts:
| Role   | Email                   | Password  |
|--------|-------------------------|-----------|
| Admin  | admin@teamflow.io       | admin123  |
| Member | member@teamflow.io      | member123 |

#### Frontend
```bash
cd frontend
npm install
cp .env.example .env
npm run dev
```

Open: http://localhost:5173

---

## 🌐 Production Deployment

### Deploy to Railway (One-Click - 5 minutes)

See [DEPLOY.md](./DEPLOY.md) for complete step-by-step instructions.

**Quick Summary:**
1. Push code to GitHub
2. Connect Railway to your GitHub repo
3. Set environment variables (MongoDB URI, JWT_SECRET)
4. Done! Auto-deploys on every git push

**Live Demo:**
- **Frontend:** [Coming Soon - Deploy on Railway]
- **Backend API:** [Coming Soon - Deploy on Railway]

### Environment Variables

**Backend (.env):**
```env
NODE_ENV=production
PORT=5000
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/teamflow
JWT_SECRET=<32+ char random string>
JWT_EXPIRES_IN=7d
FRONTEND_URL=https://your-railway-frontend-url
```

**Frontend (.env):**
```env
VITE_API_URL=https://your-railway-backend-url/api
```

---

## 📁 Project Structure

```
task-manager/
├── backend/
│   ├── models/          # Mongoose models (User, Project, Task)
│   ├── routes/          # Express routes (auth, users, projects, tasks, analytics)
│   ├── middleware/       # JWT auth middleware
│   ├── server.js        # Express app entry
│   ├── seed.js          # Demo data seeder
│   └── .env.example     # Environment template
│
└── frontend/
    └── src/
        ├── components/
        │   ├── auth/    # AuthLayout
        │   └── ui/      # AppLayout, UIComponents
        ├── context/     # Zustand auth store
        ├── pages/       # All page components
        ├── utils/       # API client, helpers
        └── styles/      # Global CSS
```

---

## 🔑 API Endpoints

### Auth
| Method | Path | Description |
|--------|------|-------------|
| POST | /api/auth/register | Register new user |
| POST | /api/auth/login | Login |
| GET | /api/auth/me | Get current user |
| PUT | /api/auth/update-profile | Update profile |
| PUT | /api/auth/change-password | Change password |

### Projects
| Method | Path | Description |
|--------|------|-------------|
| GET | /api/projects | List accessible projects |
| POST | /api/projects | Create project |
| GET | /api/projects/:id | Get project details |
| PUT | /api/projects/:id | Update project |
| DELETE | /api/projects/:id | Delete project |
| POST | /api/projects/:id/members | Add member |
| DELETE | /api/projects/:id/members/:userId | Remove member |

### Tasks
| Method | Path | Description |
|--------|------|-------------|
| GET | /api/tasks | List tasks (filterable) |
| POST | /api/tasks | Create task |
| GET | /api/tasks/:id | Get task |
| PUT | /api/tasks/:id | Update task |
| DELETE | /api/tasks/:id | Delete task |
| POST | /api/tasks/:id/comments | Add comment |
| PUT | /api/tasks/:id/subtasks/:sid | Toggle subtask |

### Analytics
| Method | Path | Description |
|--------|------|-------------|
| GET | /api/analytics/dashboard | Dashboard stats + charts |
| GET | /api/analytics/admin | Admin global stats |

---

## 🛠️ Tech Stack

**Frontend:** React 18, React Router 6, Tailwind CSS, Framer Motion, Chart.js, TanStack Query, Zustand  
**Backend:** Node.js, Express, MongoDB, Mongoose, JWT, bcryptjs, Helmet, express-rate-limit  
**Deployment:** Railway (frontend + backend), MongoDB Atlas

---

## 🏗️ Architecture & Design Patterns

- **MVC Architecture** — Organized models, routes, and controllers for clean separation of concerns
- **RESTful API** — Follows REST conventions for intuitive API design
- **JWT Authentication** — Secure token-based authentication with refresh tokens
- **State Management** — Zustand for lightweight, scalable client-side state
- **Component-based UI** — Reusable React components with proper composition
- **Error Handling** — Comprehensive error middleware and user-friendly error messages
- **Rate Limiting** — DDoS protection with express-rate-limit middleware
- **Security** — CORS enabled, helmet.js for HTTP headers, bcryptjs for password hashing

---

## 📊 Database Schema

**Users:** ID, email, password (hashed), name, role, created_at, updated_at  
**Projects:** ID, name, description, owner, members[], tasks[], analytics, timestamps  
**Tasks:** ID, title, description, project_id, assigned_to, priority, status, due_date, subtasks[], comments[], timestamps

---

## 🎯 Getting Started for Development

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/teamflow-task-manager.git
cd teamflow-task-manager/task-manager
```

### 2. Backend Setup
```bash
cd backend
npm install
cp .env.example .env
npm run dev
```

### 3. Frontend Setup (in another terminal)
```bash
cd frontend
npm install
cp .env.example .env
npm run dev
```

### 4. Seed Demo Data
```bash
cd backend
node seed.js
```

### 5. Login
- **Admin:** `admin@teamflow.io` / `admin123`
- **Member:** `member@teamflow.io` / `member123`

---

## 📈 Performance Optimizations

- ✅ **Lazy Loading** — React Router lazy components for faster initial load
- ✅ **Caching** — TanStack Query for efficient API caching and synchronization
- ✅ **Database Indexes** — Indexed MongoDB fields for fast queries
- ✅ **Compression** — Gzip compression on all API responses
- ✅ **CDN Ready** — Static frontend assets optimized for CDN delivery

---

## 🔒 Security Features

- ✅ **Password Hashing** — bcryptjs with salt rounds
- ✅ **JWT Tokens** — Secure token-based authentication
- ✅ **CORS Protection** — Configured allowed origins
- ✅ **Rate Limiting** — 15 requests per minute per IP
- ✅ **Input Validation** — Server-side validation on all endpoints
- ✅ **SQL Injection Prevention** — Using Mongoose ODM (no raw queries)
- ✅ **Environment Variables** — Sensitive data never committed

---

## 🚀 Deployment (Production)

### Live Demo
**Frontend:** [Your Railway URL]  
**Backend API:** [Your Railway API URL]

### One-Click Deploy to Railway
1. Fork this repository
2. Create a new Railway project
3. Connect your GitHub fork
4. Add MongoDB Atlas connection string
5. Deploy!

For detailed deployment steps, see [Deployment Guide](./DEPLOY.md)

---

## � Documentation

| Document | Purpose |
|----------|---------|
| [DEPLOY.md](./DEPLOY.md) | Railway deployment guide |
| [DEPLOYMENT_CHECKLIST.md](./DEPLOYMENT_CHECKLIST.md) | Pre & post-deployment checklist |
| [CONTRIBUTING.md](./CONTRIBUTING.md) | Contributing guidelines |
| [LICENSE](./LICENSE) | MIT License |

### Setup Scripts
- **Windows:** `setup.bat` — Automated setup
- **macOS/Linux:** `setup.sh` — Automated setup

---

## �💡 Future Enhancements

- 🔄 Real-time collaboration with WebSockets
- 📧 Email notifications for task updates
- 📱 Mobile app (React Native)
- 🔔 Push notifications
- 📄 Export tasks to PDF
- 🌐 Multi-language support
- 🎨 Dark mode theme
- 📅 Calendar view for tasks

---

## 📝 License

This project is open-source and available under the MIT License. See LICENSE file for details.

---

## 👨‍💻 Author

**Your Name**  
[GitHub](https://github.com/yourusername) | [LinkedIn](https://linkedin.com/in/yourprofile) | [Portfolio](https://yourportfolio.com)

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## ❓ FAQ

**Q: How do I reset the database?**  
A: Delete your MongoDB cluster and create a new one, then run `node seed.js` again.

**Q: Can I use this for production?**  
A: Yes! It's production-ready. Just ensure to set `NODE_ENV=production` and use strong environment variables.

**Q: Is there a frontend test suite?**  
A: You can add tests using Vitest + React Testing Library. Contributions welcome!

---

**Made with ❤️ for team collaboration**
#   E T H A R 
 
 