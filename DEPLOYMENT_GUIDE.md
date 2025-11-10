# Deployment Guide - Healthcare Predictive Maintenance App

## Option 1: Streamlit Community Cloud (Easiest & Free) ⭐ RECOMMENDED

### Steps:
1. **Push your code to GitHub**
   - Create a GitHub repository
   - Upload all your files (app.py, models, dataset, requirements.txt)
   - Make sure all model files are included

2. **Deploy to Streamlit Cloud**
   - Go to: https://share.streamlit.io/
   - Sign in with GitHub
   - Click "New app"
   - Select your repository
   - Set main file path: `app.py`
   - Click "Deploy"

3. **Your app will be live at**: `https://your-app-name.streamlit.app`

**Pros**: Free, easy, automatic updates
**Cons**: Public by default (can be private with Streamlit Teams)

---

## Option 2: Docker Container (Standalone Application)

### Create Dockerfile:

```dockerfile
FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Expose port
EXPOSE 8501

# Health check
HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

# Run the app
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
```

### Build and Run:
```bash
# Build the Docker image
docker build -t healthcare-maintenance-app .

# Run the container
docker run -p 8501:8501 healthcare-maintenance-app
```

**Access at**: `http://localhost:8501`

---

## Option 3: Convert to Flask/FastAPI Web Application

### Create Flask version (flask_app.py):

```python
from flask import Flask, render_template, request, jsonify
import pandas as pd
import numpy as np
import joblib
from tensorflow.keras.models import load_model
# ... (import all your prediction logic)

app = Flask(__name__)

# Load models (same as Streamlit)
# ... (your model loading code)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/predict', methods=['POST'])
def predict():
    data = request.json
    # ... (your prediction logic)
    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
```

**Pros**: More control, can add authentication, custom styling
**Cons**: Requires HTML/CSS/JS knowledge, more setup

---

## Option 4: Heroku Deployment

### Create files:

**Procfile**:
```
web: streamlit run app.py --server.port=$PORT --server.address=0.0.0.0
```

**setup.sh**:
```bash
mkdir -p ~/.streamlit/
echo "\
[server]\n\
port = $PORT\n\
enableCORS = false\n\
headless = true\n\
\n\
" > ~/.streamlit/config.toml
```

### Deploy:
```bash
heroku create your-app-name
git push heroku main
```

---

## Option 5: AWS/Azure/GCP Cloud Deployment

### AWS EC2:
1. Launch EC2 instance
2. Install dependencies
3. Run Streamlit app
4. Configure security groups

### Azure App Service:
- Use Azure Container Instances
- Deploy Docker container

### Google Cloud Run:
- Deploy Docker container
- Auto-scaling, pay-per-use

---

## Option 6: Create Standalone Executable (Windows)

### Using PyInstaller:

1. **Install PyInstaller**:
```bash
pip install pyinstaller
```

2. **Create spec file** (app.spec):
```python
# -*- mode: python ; coding: utf-8 -*-

block_cipher = None

a = Analysis(
    ['app.py'],
    pathex=[],
    binaries=[],
    datas=[
        ('scaler.pkl', '.'),
        ('xgb_maint_class.pkl', '.'),
        ('xgb_failtype.pkl', '.'),
        ('label_encoders.pkl', '.'),
        ('tfidf_vectorizer.pkl', '.'),
        ('svd_transformer.pkl', '.'),
        ('kmeans_failtypes.pkl', '.'),
        ('cluster_keywords.pkl', '.'),
        ('lstm_encoder.keras', '.'),
        ('Medical_Device_Failure_dataset.csv', '.'),
    ],
    hiddenimports=[],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)

pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.zipfiles,
    a.datas,
    [],
    name='HealthcareMaintenanceApp',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)
```

3. **Build executable**:
```bash
pyinstaller app.spec
```

**Note**: Large file size due to TensorFlow, may take time to build

---

## Quick Start: Streamlit Community Cloud (Recommended)

### Step-by-Step:

1. **Create GitHub Repository**:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/yourusername/healthcare-maintenance.git
   git push -u origin main
   ```

2. **Create .streamlit/config.toml** (optional, for custom settings):
   ```toml
   [theme]
   primaryColor = "#FF6B6B"
   backgroundColor = "#FFFFFF"
   secondaryBackgroundColor = "#F0F2F6"
   textColor = "#262730"
   font = "sans serif"
   ```

3. **Deploy on Streamlit Cloud**:
   - Visit: https://share.streamlit.io/
   - Connect GitHub account
   - Click "New app"
   - Select repository
   - Main file: `app.py`
   - Click "Deploy"

4. **Your app is live!** 🎉

---

## Security Considerations

- Add authentication if deploying publicly
- Don't commit sensitive data
- Use environment variables for secrets
- Consider rate limiting for API endpoints

---

## Performance Optimization

- Use `@st.cache_resource` (already done)
- Consider model quantization for faster loading
- Use CDN for static assets
- Implement lazy loading for large datasets

---

## Need Help?

- Streamlit Docs: https://docs.streamlit.io/
- Streamlit Community: https://discuss.streamlit.io/
- Docker Docs: https://docs.docker.com/

