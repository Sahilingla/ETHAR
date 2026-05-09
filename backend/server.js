const express = require('express');
const mongoose = require('mongoose');
const { MongoMemoryServer } = require('mongodb-memory-server');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');
const rateLimit = require('express-rate-limit');
require('dotenv').config();

const authRoutes = require('./routes/auth');
const userRoutes = require('./routes/users');
const projectRoutes = require('./routes/projects');
const taskRoutes = require('./routes/tasks');
const analyticsRoutes = require('./routes/analytics');
const User = require('./models/User');

const app = express();

// Security middleware
app.use(helmet());
app.use(cors({
  origin: process.env.FRONTEND_URL || 'http://localhost:5173',
  credentials: true
}));

// Rate limiting
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 100,
  message: { error: 'Too many requests, please try again later.' }
});
app.use('/api/', limiter);

// Body parsing
app.use(express.json({ limit: '10mb' }));
app.use(express.urlencoded({ extended: true }));
app.use(morgan('combined'));

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/users', userRoutes);
app.use('/api/projects', projectRoutes);
app.use('/api/tasks', taskRoutes);
app.use('/api/analytics', analyticsRoutes);

// Health check
app.get('/health', (req, res) => {
  res.json({ status: 'OK', timestamp: new Date().toISOString() });
});

// 404 handler
app.use((req, res) => {
  res.status(404).json({ error: 'Route not found' });
});

// Error handler
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(err.status || 500).json({
    error: err.message || 'Internal Server Error'
  });
});

let inMemoryServer = null;

const startInMemoryMongo = async () => {
  inMemoryServer = await MongoMemoryServer.create();
  const uri = inMemoryServer.getUri();
  console.log('⚡ Using in-memory MongoDB for development');
  return uri;
};

const seedDemoUsers = async () => {
  const count = await User.countDocuments();
  if (count > 0) return;

  const demoUsers = [
    { name: 'Alex Admin', email: 'admin@teamflow.io', password: 'admin123', role: 'admin' },
    { name: 'Morgan Member', email: 'member@teamflow.io', password: 'member123', role: 'member' },
  ];

  await User.create(demoUsers);
  console.log('✅ Seeded demo users for in-memory DB');
};

// Database connection
const connectDB = async () => {
  const urisToTry = [];
  if (process.env.MONGODB_URI) urisToTry.push(process.env.MONGODB_URI);
  urisToTry.push('mongodb://localhost:27017/taskmanager');

  for (const uri of urisToTry) {
    try {
      await mongoose.connect(uri);
      console.log('✅ MongoDB connected');
      return;
    } catch (err) {
      console.error(`⚠️ MongoDB connection failed for ${uri}:`, err.message);
    }
  }

  if (process.env.NODE_ENV !== 'production') {
    try {
      const inMemoryUri = await startInMemoryMongo();
      await mongoose.connect(inMemoryUri);
      console.log('✅ Connected to in-memory MongoDB');
      await seedDemoUsers();
      return;
    } catch (err) {
      console.error('❌ In-memory MongoDB connection error:', err);
    }
  }

  console.error('❌ MongoDB connection error: all connection attempts failed.');
  process.exit(1);
};

const PORT = process.env.PORT || 5000;

connectDB().then(() => {
  app.listen(PORT, () => {
    console.log(`🚀 Server running on port ${PORT}`);
  });
});

module.exports = app;
