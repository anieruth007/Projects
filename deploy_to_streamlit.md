# 🚀 Deploy to Streamlit Cloud - Step by Step Guide

## Prerequisites

1. **Install Git** (if not already installed):
   - Download from: https://git-scm.com/download/win
   - Install with default settings
   - Restart your terminal after installation

2. **Create a GitHub Account** (if you don't have one):
   - Go to: https://github.com/signup
   - Sign up for free

---

## Step 1: Initialize Git Repository (Local)

Open PowerShell in your project folder and run:

```powershell
# Initialize git repository
git init

# Add all files
git add .

# Create first commit
git commit -m "Initial commit: Healthcare Predictive Maintenance App"
```

---

## Step 2: Create GitHub Repository

1. **Go to GitHub**: https://github.com/new
2. **Repository name**: `healthcare-predictive-maintenance` (or any name you like)
3. **Description**: "Hybrid Explainable Predictive Maintenance for Healthcare Equipment"
4. **Visibility**: 
   - Choose **Public** (for free Streamlit Cloud)
   - Or **Private** (requires Streamlit Teams account)
5. **DO NOT** initialize with README, .gitignore, or license (we already have these)
6. Click **"Create repository"**

---

## Step 3: Connect Local Repository to GitHub

After creating the repository, GitHub will show you commands. Use these:

```powershell
# Add remote repository (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/healthcare-predictive-maintenance.git

# Rename branch to main (if needed)
git branch -M main

# Push to GitHub
git push -u origin main
```

**Note**: You'll be prompted for your GitHub username and password (use a Personal Access Token, not your password - see below)

---

## Step 4: Create GitHub Personal Access Token

GitHub requires a token instead of password:

1. Go to: https://github.com/settings/tokens
2. Click **"Generate new token"** → **"Generate new token (classic)"**
3. **Note**: "Streamlit Deployment"
4. **Expiration**: Choose 90 days or No expiration
5. **Select scopes**: Check `repo` (full control of private repositories)
6. Click **"Generate token"**
7. **Copy the token** (you won't see it again!)

When pushing, use:
- **Username**: Your GitHub username
- **Password**: Paste the token you just copied

---

## Step 5: Deploy to Streamlit Cloud

1. **Go to Streamlit Cloud**: https://share.streamlit.io/
2. **Sign in** with your GitHub account
3. Click **"New app"** button
4. **Fill in the form**:
   - **Repository**: Select `YOUR_USERNAME/healthcare-predictive-maintenance`
   - **Branch**: `main`
   - **Main file path**: `app.py`
   - **App URL** (optional): Choose a custom name like `healthcare-maintenance`
5. Click **"Deploy"**

---

## Step 6: Wait for Deployment

- Streamlit will install dependencies and start your app
- This takes 2-5 minutes
- You'll see build logs in real-time
- When done, you'll see: **"Your app is live!"**

---

## Step 7: Access Your Live App

Your app will be available at:
```
https://YOUR_APP_NAME.streamlit.app
```

Or:
```
https://share.streamlit.io/YOUR_USERNAME/healthcare-predictive-maintenance/main
```

---

## Updating Your App

Whenever you make changes:

```powershell
git add .
git commit -m "Update: description of changes"
git push
```

Streamlit Cloud will automatically redeploy your app!

---

## Troubleshooting

### Issue: "Git is not recognized"
**Solution**: Install Git from https://git-scm.com/download/win and restart terminal

### Issue: "Authentication failed"
**Solution**: Use Personal Access Token instead of password

### Issue: "Model files too large"
**Solution**: 
- Use Git LFS: `git lfs install` then `git lfs track "*.pkl" "*.keras"`
- Or host models separately and download in app

### Issue: "Build failed"
**Solution**: 
- Check requirements.txt is correct
- Check all model files are in repository
- Check Streamlit Cloud logs for errors

---

## Need Help?

- Streamlit Community: https://discuss.streamlit.io/
- GitHub Docs: https://docs.github.com/
- Git Docs: https://git-scm.com/doc

---

## Quick Command Reference

```powershell
# Initialize repository
git init
git add .
git commit -m "Initial commit"

# Connect to GitHub (replace YOUR_USERNAME and REPO_NAME)
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git
git branch -M main
git push -u origin main

# Update app
git add .
git commit -m "Update message"
git push
```

