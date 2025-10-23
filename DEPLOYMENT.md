# Flora E-commerce - Production Deployment

## 🚀 Trunk-Based Development (TBD) Deployment Process

### Branch Structure
```
main                → môi trường dev (auto deploy khi push)
stable/x.x.x        → môi trường staging (auto deploy khi tag)
production          → môi trường production (auto deploy khi push)
```

### Docker Image Tagging Strategy

#### Image Tags by Environment
- **Dev**: `luongnguyenminhan/flora:*-dev-{run_number}`, `luongnguyenminhan/flora:*-dev-latest`
- **Staging**: `luongnguyenminhan/flora:*-staging-{version}`, `luongnguyenminhan/flora:*-staging-latest`
- **Production**: `luongnguyenminhan/flora:*-prod-{run_number}`, `luongnguyenminhan/flora:*-prod-latest`

#### Tag Examples
```
Backend Dev:        luongnguyenminhan/flora:backend-dev-123, luongnguyenminhan/flora:backend-dev-latest
Frontend Staging:   luongnguyenminhan/flora:frontend-staging-1.2.0, luongnguyenminhan/flora:frontend-staging-latest
Backend Prod:       luongnguyenminhan/flora:backend-prod-456, luongnguyenminhan/flora:backend-prod-latest
```

### Production Setup

#### 1. Environment Variables
Copy and configure your production environment variables:

```bash
cp .env.prod.example .env.prod
# Edit .env.prod with your actual production values
```

#### 2. Deploy to Production
```bash
# Load environment variables
source .env.prod

# Deploy using docker-compose
docker compose up -d

# Or use the deployment script
./deploy.sh production latest
```

#### 3. Architecture
- **3 Backend instances** (ports 8081-8083) for load balancing
- **3 Frontend instances** (ports 3001-3003) for load balancing
- **1 MySQL database** with persistent storage
- **1 Nginx load balancer** (ports 80/443)

### GitHub Actions Workflow

#### Automatic Deployments
- **Dev**: Auto-deploy when `main` branch is pushed
- **Staging**: Auto-deploy when `stable/x.x.x` tag is created
- **Production**: Auto-deploy when `production` branch is pushed

#### Manual Deployment Commands

```bash
# Deploy to dev
./deploy.sh dev <version>

# Deploy to staging
./deploy.sh staging <version>

# Deploy to production
./deploy.sh production latest
```

### TBD Process

#### Daily Development
1. Commit code directly to `main`
2. GitHub Actions builds and deploys to dev automatically

#### Release to Staging
```bash
# Create stable tag
git tag stable/1.2.0
git push origin stable/1.2.0
```
→ Auto-deploys to staging

#### Promote to Production
```bash
# Merge stable tag to production
git checkout production
git merge --ff-only stable/1.2.0
git push origin production
```
→ Auto-deploys to production

#### Hotfix
```bash
# Create hotfix branch
git checkout -b hotfix/1.2.1 production
# Fix the issue, commit
git push origin hotfix/1.2.1

# Merge back to both branches
git checkout production
git merge --ff-only hotfix/1.2.1
git push origin production

git checkout main
git merge --ff-only hotfix/1.2.1
git push origin main

# Create new stable tag if needed
git tag stable/1.2.1
git push origin stable/1.2.1
```

### Rollback
```bash
# Rollback production
git checkout production
git reset --hard stable/1.1.0
git push -f origin production
```

### Security Notes
- Database credentials are loaded from environment variables
- No sensitive data in Docker images
- SSL/TLS ready (configure nginx.prod.conf for HTTPS)
- Security headers configured in Nginx
