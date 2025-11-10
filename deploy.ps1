# PowerShell Script to Deploy Healthcare Maintenance App to GitHub
# Run this script in PowerShell: .\deploy.ps1

Write-Host "🚀 Healthcare Maintenance App - Deployment Script" -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""

# Check if git is installed
try {
    $gitVersion = git --version
    Write-Host "✅ Git is installed: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Git is not installed!" -ForegroundColor Red
    Write-Host "Please install Git from: https://git-scm.com/download/win" -ForegroundColor Yellow
    Write-Host "Then restart PowerShell and run this script again." -ForegroundColor Yellow
    exit
}

Write-Host ""
Write-Host "Step 1: Checking if git repository is initialized..." -ForegroundColor Yellow

# Check if .git exists
if (Test-Path .git) {
    Write-Host "✅ Git repository already initialized" -ForegroundColor Green
} else {
    Write-Host "Initializing git repository..." -ForegroundColor Yellow
    git init
    Write-Host "✅ Git repository initialized" -ForegroundColor Green
}

Write-Host ""
Write-Host "Step 2: Adding files to git..." -ForegroundColor Yellow
git add .
Write-Host "✅ Files added" -ForegroundColor Green

Write-Host ""
Write-Host "Step 3: Checking for existing commits..." -ForegroundColor Yellow
$commitCount = (git rev-list --count HEAD 2>$null)
if ($commitCount -eq 0) {
    Write-Host "Creating initial commit..." -ForegroundColor Yellow
    git commit -m "Initial commit: Healthcare Predictive Maintenance App"
    Write-Host "✅ Initial commit created" -ForegroundColor Green
} else {
    Write-Host "✅ Repository has $commitCount commit(s)" -ForegroundColor Green
    Write-Host "You can create a new commit with: git commit -m 'Your message'" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "Step 4: Checking remote repository..." -ForegroundColor Yellow
$remote = git remote get-url origin 2>$null
if ($remote) {
    Write-Host "✅ Remote repository configured: $remote" -ForegroundColor Green
} else {
    Write-Host "⚠️  No remote repository configured" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "To connect to GitHub:" -ForegroundColor Cyan
    Write-Host "1. Create a repository on GitHub: https://github.com/new" -ForegroundColor White
    Write-Host "2. Then run:" -ForegroundColor White
    Write-Host "   git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git" -ForegroundColor Yellow
    Write-Host "   git branch -M main" -ForegroundColor Yellow
    Write-Host "   git push -u origin main" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "📋 Next Steps:" -ForegroundColor Cyan
Write-Host "1. Create a GitHub repository at: https://github.com/new" -ForegroundColor White
Write-Host "2. Connect your local repo (see commands above)" -ForegroundColor White
Write-Host "3. Deploy to Streamlit Cloud: https://share.streamlit.io/" -ForegroundColor White
Write-Host ""
Write-Host "📖 For detailed instructions, see: deploy_to_streamlit.md" -ForegroundColor Cyan
Write-Host ""

# Ask if user wants to check status
$checkStatus = Read-Host "Do you want to see git status? (y/n)"
if ($checkStatus -eq 'y' -or $checkStatus -eq 'Y') {
    Write-Host ""
    git status
}

Write-Host ""
Write-Host "✨ Done! Good luck with your deployment!" -ForegroundColor Green

