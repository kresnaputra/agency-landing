# Cloudflare Pages Deployment Guide

## 📋 Overview
This guide will help you migrate from GitHub Pages to Cloudflare Pages with your custom domain.

## 🚀 What's Already Done (by Panda)

### ✅ Files Created:
- `_headers` - Security headers configuration
- `_redirects` - URL redirects (optional)
- `package.json` - Project metadata
- This guide (`CLOUDFLARE-SETUP.md`)

### ✅ Repository Ready:
- All website files are in place
- Git repository configured
- Ready for Cloudflare Pages integration

## 🔐 Steps YOU Need to Do (≈5-10 minutes)

### Step 1: Login to Cloudflare Dashboard
1. Go to https://dash.cloudflare.com/
2. Login with your account

### Step 2: Create Cloudflare Pages Project
1. Navigate to **Workers & Pages** → **Pages**
2. Click **"Create a project"**
3. Click **"Connect to Git"**

### Step 3: Connect GitHub Repository
1. Select **GitHub** as Git provider
2. Authorize Cloudflare to access your GitHub account
3. Select repository: `kresnaputra/agency-landing`

### Step 4: Configure Build Settings
**Use these exact settings:**

| Setting | Value |
|---------|-------|
| Project name | `agency-landing` |
| Production branch | `main` |
| Framework preset | `None` |
| Build command | **(leave empty)** |
| Build output directory | `/` |

### Step 5: Deploy
1. Click **"Save and Deploy"**
2. Wait 2-3 minutes for deployment

## 🌐 Custom Domain Setup

### After successful deployment:
1. Go to project **Settings** → **Custom domains**
2. Click **"Set up a custom domain"**
3. Enter your domain (e.g., `agency.domainkamu.com`)
4. Follow DNS prompts

### DNS Configuration:
- **If domain is on Cloudflare DNS:** Automatic setup
- **If domain is elsewhere:** Add CNAME record:
  ```
  Type: CNAME
  Name: agency (or @ for root domain)
  Target: agency-landing.pages.dev
  TTL: Auto
  Proxy: ON (orange cloud)
  ```

## ⚡ Advanced Features (Optional)

### 1. Preview Deployments
Every pull request automatically gets a preview URL.

### 2. Analytics
View analytics in Cloudflare Pages dashboard.

### 3. Environment Variables
Add in Settings → Environment variables if needed.

### 4. Custom Build Commands
If you add a build process later, update in Settings → Build & deployments.

## 🔄 GitHub Integration

### Automatic Deploys:
- Every push to `main` branch → automatic deploy
- Every pull request → preview deploy

### Manual Trigger:
You can also trigger manual deployments from Cloudflare dashboard.

## 🐛 Troubleshooting

### Common Issues:

1. **Build fails:**
   - Check build command is empty (static site)
   - Ensure `index.html` is at root

2. **Domain not working:**
   - Check DNS propagation (can take up to 24 hours)
   - Verify CNAME record is correct

3. **Mixed content warnings:**
   - Ensure all resources use HTTPS
   - Check `_headers` file

## 📞 Support
- Cloudflare Docs: https://developers.cloudflare.com/pages/
- GitHub Repo: https://github.com/kresnaputra/agency-landing

## ✅ Done!
Your site will be live at:
- Cloudflare URL: `https://agency-landing.pages.dev`
- Custom domain: `https://your-domain.com`

**Performance improvements expected:**
- 50-70% faster loading worldwide
- Automatic SSL/TLS
- DDoS protection
- Analytics included

---

*Last updated by Panda 🐼 on $(date)*