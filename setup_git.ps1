# Git Setup Script for Healthcare Maintenance App
# This script helps configure Git and prepare for GitHub deployment

$env:PATH += ";C:\Program Files\Git\bin"

Write-Host "🔧 Git Configuration Setup" -ForegroundColor Cyan
Write-Host "=========================" -ForegroundColor Cyan
Write-Host ""

# Check if git config is set
$userName = git config --global user.name 2>$null
$userEmail = git config --global user.email 2>$null

if (-not $userName) {
    Write-Host "Git user.name is not configured." -ForegroundColor Yellow
    $name = Read-Host "Enter your name (for Git commits)"
    if ($name) {
        git config --global user.name "$name"
        Write-Host "✅ Git user.name set to: $name" -ForegroundColor Green
    }
} else {
    Write-Host "✅ Git user.name: $userName" -ForegroundColor Green
}

if (-not $userEmail) {
    Write-Host "Git user.email is not configured." -ForegroundColor Yellow
    $email = Read-Host "Enter your email (for Git commits)"
    if ($email) {
        git config --global user.email "$email"
        Write-Host "✅ Git user.email set to: $email" -ForegroundColor Green
    }
} else {
    Write-Host "✅ Git user.email: $userEmail" -ForegroundColor Green
}

Write-Host ""
Write-Host "📦 Preparing repository..." -ForegroundColor Yellow

# Add all files
git add .
Write-Host "✅ Files added to staging" -ForegroundColor Green

# Check if there are changes to commit
$status = git status --short
if ($status) {
    Write-Host ""
    Write-Host "Creating initial commit..." -ForegroundColor Yellow
    git commit -m "Initial commit: Healthcare Predictive Maintenance App"
    Write-Host "✅ Initial commit created!" -ForegroundColor Green
} else {
    Write-Host "✅ Repository is up to date" -ForegroundColor Green
}

Write-Host ""
Write-Host "=========================" -ForegroundColor Cyan
Write-Host "✅ Git setup complete!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Next Steps:" -ForegroundColor Cyan
Write-Host "1. Create a GitHub repository at: https://github.com/new" -ForegroundColor White
Write-Host "2. Then run these commands (replace YOUR_USERNAME and REPO_NAME):" -ForegroundColor White
Write-Host ""
Write-Host "   git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git" -ForegroundColor Yellow
Write-Host "   git branch -M main" -ForegroundColor Yellow
Write-Host "   git push -u origin main" -ForegroundColor Yellow
Write-Host ""
Write-Host "3. Deploy to Streamlit Cloud: https://share.streamlit.io/" -ForegroundColor White
Write-Host ""
Write-Host "📖 See deploy_to_streamlit.md for detailed instructions" -ForegroundColor Cyan

