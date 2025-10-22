# Flora E-commerce Platform

Welcome to Flora! This is a modern e-commerce platform built with a distributed team approach. This README guides your team through initial setup, development workflow, and deployment preparation.

---

## Table of Contents

- [Flora E-commerce Platform](#flora-e-commerce-platform)
  - [Table of Contents](#table-of-contents)
  - [Project Structure](#project-structure)
  - [Environment Configuration](#environment-configuration)
    - [Creating `.env` Files](#creating-env-files)
    - [Security Notes](#security-notes)
  - [Git Workflow \& Commit Guidelines](#git-workflow--commit-guidelines)
    - [Commit Message Format](#commit-message-format)
    - [Flora Commit Examples](#flora-commit-examples)
    - [Branch Naming](#branch-naming)
    - [Important Committing Rules](#important-committing-rules)
  - [Initial Setup Checklist](#initial-setup-checklist)
    - [Frontend Developer](#frontend-developer)
    - [Backend Developer](#backend-developer)

---

## Project Structure

```tree
flora-ecommerce/
├── frontend/                    # Frontend application (React, Vue, Angular, etc.)
├── backend/                     # Backend API & services (Node.js, Python, Go, etc.)
├── .github/                     # GitHub workflows & instructions
├── .tasks/                      # Task tracking (excluded from commits)
├── .gitignore                   # Git ignore rules
└── README.md                    # This file
```

**Important:** Each team member initializes their project within their respective folder (`frontend/` or `backend/`). The folder structure remains as shown—no nested subfolders needed.

---

You orchestrate the entire Flora platform. Your responsibilities:

1. **Monitor team progress** on initial setups
2. **Verify** both frontend and backend are running locally
3. **Create Dockerfiles** after team initializes projects:
   - `frontend/Dockerfile` - Package frontend application
   - `backend/Dockerfile` - Package backend application
4. **Set up Docker Compose** (`docker-compose.yml`) for local orchestration
5. **Configure environment variables** for containerized environments
6. **Prepare deployment pipeline** with CI/CD

---

## Environment Configuration

### Creating `.env` Files

Each service uses environment variables for configuration. This approach keeps secrets out of version control.

**For Frontend Developer:**

Create `frontend/.env.example`:

```env
# Frontend Environment Configuration
REACT_APP_API_URL=http://localhost:3001
REACT_APP_ENV=development
```

Create `frontend/.env` (local, excluded from git):

```env
REACT_APP_API_URL=http://localhost:3001
REACT_APP_ENV=development
```

**For Backend Developer:**

Create `backend/.env.example`:

```env
# Backend Environment Configuration
NODE_ENV=development
PORT=3001
DATABASE_URL=postgresql://user:password@localhost:5432/flora
JWT_SECRET=your-secret-key
CORS_ORIGIN=http://localhost:3000
```

Create `backend/.env` (local, excluded from git):

```env
NODE_ENV=development
PORT=3001
DATABASE_URL=postgresql://user:password@localhost:5432/flora
JWT_SECRET=dev-secret-key-change-in-production
CORS_ORIGIN=http://localhost:3000
```

### Security Notes

- **Never commit `.env`** files containing secrets
- `.env.example` shows variable structure but uses placeholder values
- Secrets are injected at deployment time by PM/DevOps
- Each developer has their own local `.env` for development

---

## Git Workflow & Commit Guidelines

Flora uses **trunk-based development** with strict commit message standards. This ensures clear history and safe deployments.

### Commit Message Format

```text
<type>(scope): subject
```

**Types** (lowercase):

- `feat` - New feature
- `fix` - Bug fix
- `refactor` - Code change (no feature/bug fix)
- `docs` - Documentation changes
- `style` - Formatting, linting (no logic change)
- `perf` - Performance improvements
- `test` - Adding/fixing tests
- `chore` - Maintenance, dependencies
- `build` - CI/build system changes
- `revert` - Revert previous commit

**Scopes** for Flora (optional but recommended):

- `(frontend)` - Changes in frontend folder
- `(backend)` - Changes in backend folder
- `(api)` - API-specific changes
- `(docker)` - Docker/container changes
- `(config)` - Configuration changes
- `(docs)` - Documentation changes

**Subject Rules:**

- Max ~72 characters
- Use imperative mood: "Add", "Fix", "Update" (not "Added", "Fixed")
- No trailing period
- Lowercase (except proper nouns)

### Flora Commit Examples

```bash
# Frontend features
git commit -m "feat(frontend): add product filter component"
git commit -m "fix(frontend): resolve checkout form validation"
git commit -m "style(frontend): reformat product card styles"

# Backend features
git commit -m "feat(backend): implement user authentication endpoint"
git commit -m "fix(backend): handle null database queries"
git commit -m "perf(backend): optimize product search query"

# Infrastructure
git commit -m "chore(docker): update node base image to 18-alpine"
git commit -m "build: configure GitHub Actions CI pipeline"

# Documentation
git commit -m "docs: add API endpoint documentation"
git commit -m "docs: update README with deployment steps"
```

### Branch Naming

Your current feature branch follows the convention:

```text
task/create-team-readme_2025-10-22_1
  └─ task/[IDENTIFIER]_[YYYY-MM-DD]_[N]
```

### Important Committing Rules

- **Stage only related changes** per commit (keep commits focused)
- **Never commit `.env` files** or secrets
- **Exclude `.tasks/*` folder**: `git add --all :!.tasks/*`
- Rebase and squash for clean history before merging
- Verify no secrets before pushing

---

## Initial Setup Checklist

### Frontend Developer

- [ ] Clone repository and navigate to `flora-ecommerce`
- [ ] Move to `frontend/` folder
- [ ] Initialize project with chosen framework
- [ ] Create `.env` file from `.env.example`
- [ ] Install all dependencies (`npm install`, `pip install`, etc.)
- [ ] Verify project runs locally without errors
- [ ] Make first commit: `feat(frontend): initialize project scaffold`
- [ ] Report completion to PM/DevOps

### Backend Developer

- [ ] Clone repository and navigate to `flora-ecommerce`
- [ ] Move to `backend/` folder
- [ ] Initialize project with chosen framework
- [ ] Create `.env` file from `.env.example`
- [ ] Install all dependencies (`npm install`, `pip install`, etc.)
- [ ] Verify API/server runs locally without errors
- [ ] Make first commit: `feat(backend): initialize project scaffold`
- [ ] Report completion to PM/DevOps

---

**Flora E-commerce Platform** | Trunk-Based Development | Team Collaboration Ready
