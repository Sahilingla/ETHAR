# 🚀 Railway Deployment Guide

Quick and easy deployment to Railway with MongoDB Atlas.

## Prerequisites

- GitHub account with repo pushed
- Railway account (https://railway.app - free tier available)
- MongoDB Atlas account (https://cloud.mongodb.com - free tier available)

---

## Step 1: Set Up MongoDB Atlas

1. **Create Cluster:**
   - Go to https://cloud.mongodb.com
   - Click "Create" → "Build a Database"
   - Choose "Free" tier
   - Select your region
   - Click "Create Cluster"

2. **Create Database User:**
   - Go to "Database Access"
   - Click "Add New Database User"
   - Username: `teamflow`
   - Password: Generate strong password (save it!)
   - Click "Add User"

3. **Allow Network Access:**
   - Go to "Network Access"
   - Click "Add IP Address"
   - Select "Allow Access from Anywhere" → 0.0.0.0/0
   - Click "Confirm"

4. **Get Connection String:**
   - Click "Connect" on your cluster
   - Choose "Connect your application"
   - Copy connection string
   - Replace `<password>` with your database user password
   - Save this string - you'll need it soon!

---

## Step 2: Deploy to Railway

### Option A: Railway Dashboard (Easiest - 5 minutes)

1. **Go to Railway:**
   - Open https://railway.app
   - Sign up or login with GitHub

2. **Create New Project:**
   - Click "Create New Project"
   - Select "Deploy from GitHub repo"
   - Connect your GitHub account
   - Select your `ETHAR` repository

3. **Configure Backend:**
   - Click "Add Service"
   - Choose "GitHub Repo"
   - Select your repository
   - Click "Deploy"
   - In service settings:
     - Set "Root Directory" to `backend`
     - Click "Deploy"

4. **Add Environment Variables (Backend):**
   - Go to "Variables" tab
   - Add these variables:
     ```
     NODE_ENV=production
     MONGODB_URI=<your_mongodb_connection_string>
     JWT_SECRET=<generate_random_32_char_string>
     JWT_EXPIRES_IN=7d
     FRONTEND_URL=<your_railway_frontend_url>
     PORT=5000
     ```

5. **Deploy Frontend:**
   - Add another service (same repo)
   - Set "Root Directory" to `frontend`
   - Add environment variable:
     ```
     VITE_API_URL=<your_railway_backend_url>/api
     ```

6. **Done!**
   - Railway auto-deploys on every git push
   - You'll get a public URL for frontend and backend

### Option B: Railway CLI

```bash
# Install Railway CLI
npm install -g @railway/cli

# Login
railway login

# Link to GitHub repo
railway link

# Add environment variables
railway env:set NODE_ENV=production
railway env:set MONGODB_URI=<your_mongodb_uri>
railway env:set JWT_SECRET=<random_32_chars>

# Deploy
railway deploy
```

---

## Step 3: Verify Deployment

1. **Test Backend:**
   ```bash
   curl https://<your-backend-url>/api/auth/me
   # Should return 401 (expected without token)
   ```

2. **Open Frontend:**
   - Click the frontend URL in Railway dashboard
   - Should load without errors

3. **Test Login:**
   - Demo account: `admin@teamflow.io` / `admin123`
   - Create a project
   - Add a task
   - Check analytics

---

## Environment Variables

### Backend (.env)
```env
NODE_ENV=production
PORT=5000
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/teamflow
JWT_SECRET=your_random_32_character_string_here
JWT_EXPIRES_IN=7d
FRONTEND_URL=https://your-railway-frontend.up.railway.app
```

### Frontend (.env)
```env
VITE_API_URL=https://your-railway-backend.up.railway.app/api
```

---

## Troubleshooting

### 502 Bad Gateway
- Check backend is running: `railway status`
- Check logs: `railway logs`
- Verify MONGODB_URI is correct
- Ensure JWT_SECRET is set

### Frontend shows "Cannot connect to API"
- Check `VITE_API_URL` environment variable
- Verify it includes `/api` at the end
- Check backend is running and responding

### Database Connection Error
- Verify MongoDB connection string is correct
- Check MongoDB username/password
- Ensure IP whitelist includes 0.0.0.0/0

### Build Fails
- Check logs: `railway logs`
- Ensure backend has `npm run dev` or `npm start` configured
- Ensure frontend has `npm run build` configured

---

## Auto-Deploy on Git Push

Railway automatically deploys when you push to main branch:

```bash
git add .
git commit -m "Fix: Update feature"
git push origin main
# Railway detects push and deploys automatically
```

---

## View Logs

```bash
railway logs
```

Or in Railway dashboard → Your service → Logs tab

---

## Restart Services

```bash
railway down
railway up
```

---

## Scale Up

If you need more resources:
1. Go to Railway dashboard
2. Select your service
3. Go to "Settings"
4. Increase CPU/Memory
5. Click "Save"

---

## Need Help?

- **Railway Docs:** https://docs.railway.app
- **MongoDB Docs:** https://docs.atlas.mongodb.com
- **Troubleshooting:** Check DEPLOY.md or logs

---

**Deployment Time:** ~10-15 minutes  
**Cost:** Free tier available for both Railway and MongoDB Atlas  
**Status:** Live after deployment ✅
