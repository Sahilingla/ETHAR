# 📋 Contributing Guidelines

Thank you for your interest in contributing to TeamFlow! This document provides guidelines for contributing.

## Code of Conduct

- Be respectful and inclusive
- Provide constructive feedback
- Help others learn and grow

## Getting Started

1. Fork the repository
2. Clone your fork locally
3. Create a feature branch: `git checkout -b feature/your-feature`
4. Make your changes
5. Commit with clear messages: `git commit -m 'Add: description'`
6. Push to your fork
7. Create a Pull Request

## Development Setup

### Backend
```bash
cd backend
npm install
cp .env.example .env
npm run dev
```

### Frontend
```bash
cd frontend
npm install
cp .env.example .env
npm run dev
```

## Coding Standards

### Backend (Node.js/Express)
- Use const/let (no var)
- Arrow functions preferred
- Comments for complex logic
- Error handling required
- Validate all inputs

### Frontend (React)
- Functional components only
- Use hooks for state
- Props validation with PropTypes or TypeScript
- Clear component naming
- Reusable components preferred

## Commit Messages

Format: `TYPE: Brief description`

Types:
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation
- `style:` Formatting
- `refactor:` Code restructuring
- `test:` Adding tests
- `chore:` Maintenance

Example: `feat: Add task filtering by status`

## Pull Request Process

1. Update README.md if needed
2. Test your changes thoroughly
3. Ensure no breaking changes
4. Add descriptive PR title
5. Link related issues
6. Request review from maintainers

## Testing

Before submitting:
- [ ] No console errors
- [ ] Functionality tested
- [ ] Responsive design checked
- [ ] No hardcoded values
- [ ] Error cases handled

## Reporting Bugs

Include:
- Clear description
- Steps to reproduce
- Expected vs actual behavior
- Screenshots/logs if applicable
- Browser/environment info

## Feature Requests

Include:
- Use case description
- Benefits
- Possible implementation approach
- Screenshots/mockups if applicable

## Questions?

Open an issue with tag `question` or start a discussion in the repo.

---

**Happy coding!** 🚀
