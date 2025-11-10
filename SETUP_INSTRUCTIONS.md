# Setup Instructions for Healthcare Predictive Maintenance App

## Quick Start

1. **Install Dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

2. **Install Visual C++ Redistributable (Windows only):**
   - Download from: https://aka.ms/vs/17/release/vc_redist.x64.exe
   - Run the installer
   - Restart your computer

3. **Run the App:**
   ```bash
   streamlit run app.py
   ```

## Troubleshooting

### DLL Load Error (Windows)

If you see: `ImportError: DLL load failed while importing _pywrap_tensorflow_internal`

**Solution:**
1. Install Microsoft Visual C++ Redistributable 2015-2022 (x64)
   - Direct link: https://aka.ms/vs/17/release/vc_redist.x64.exe
2. Restart your computer
3. Try running the app again

### Python Version Issues

If you're using Python 3.13 and having issues:
- Consider using Python 3.11 or 3.12 (more stable with TensorFlow)
- Create a virtual environment:
  ```bash
  python -m venv venv
  venv\Scripts\activate  # Windows
  pip install -r requirements.txt
  ```

## Required Files

Make sure these files are in the same directory as `app.py`:
- `scaler.pkl`
- `xgb_maint_class.pkl`
- `xgb_failtype.pkl`
- `label_encoders.pkl`
- `tfidf_vectorizer.pkl`
- `svd_transformer.pkl`
- `kmeans_failtypes.pkl`
- `cluster_keywords.pkl`
- `lstm_encoder.keras`
- `Medical_Device_Failure_dataset.csv`

## Contact

For issues or questions, contact: Anieruth Sridhar

