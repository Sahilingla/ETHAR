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

---

## ⚙️ Backend Setup

```bash
cd backend
npm install
cp .env.example .env
# Fill in your MONGODB_URI and JWT_SECRET in .env
npm run dev
```

Seed demo data:
```bash
node seed.js
```

Demo accounts after seeding:
| Role   | Email                   | Password  |
|--------|-------------------------|-----------|
| Admin  | admin@teamflow.io       | admin123  |
| Member | member@teamflow.io      | member123 |

---

## 🖥️ Frontend Setup

```bash
cd frontend
npm install
cp .env.example .env
# Set VITE_API_URL=http://localhost:5000/api
npm run dev
```

Open: http://localhost:5173

---

## 🌐 Deploy to Railway

### Backend
1. Create a new Railway project
2. Connect your GitHub repo
3. Set root directory to `backend`
4. Add environment variables:
   - `MONGODB_URI` — your MongoDB Atlas connection string
   - `JWT_SECRET` — a long random string (32+ chars)
   - `FRONTEND_URL` — your deployed frontend URL
   - `NODE_ENV=production`

### Frontend
1. Add a new service in the same Railway project
2. Set root directory to `frontend`
3. Add environment variable:
   - `VITE_API_URL` — your deployed backend URL + `/api`

### MongoDB Atlas
1. Create a free cluster at https://cloud.mongodb.com
2. Create a database user
3. Allow access from anywhere (0.0.0.0/0) in Network Access
4. Copy your connection string

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

## 💡 Future Enhancements

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
#   E T H A R  
 