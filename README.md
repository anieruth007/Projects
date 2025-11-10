# 🩺 Hybrid Explainable Predictive Maintenance — Healthcare Equipment

An AI-powered predictive maintenance system for healthcare equipment that combines **LSTM**, **XGBoost**, and **NLP** techniques to predict maintenance classes and failure types.

## 🚀 Features

- **Maintenance Class Prediction** (1-3): Predicts equipment maintenance risk levels
- **Failure Type Analysis**: Identifies likely failure types with probability scores
- **NLP-Based Insights**: Extracts failure reasons from maintenance reports
- **Interactive Dashboard**: Beautiful Streamlit interface with multiple visualization tabs
- **Similar Report Matching**: Finds similar past maintenance reports
- **Analytics Dashboard**: Comprehensive analytics and sustainability metrics

## 📊 Dashboard Tabs

1. **🔍 Prediction**: Enter equipment details and get AI-powered predictions
2. **📊 Analytics**: Visualize maintenance patterns, device distributions, and failure frequencies
3. **💬 Failure Insights**: NLP-based word clouds and cluster analysis
4. **🌱 Sustainability**: Operational efficiency metrics and recommendations

## 🛠️ Installation

### Prerequisites

- Python 3.11 or 3.12 (recommended)
- Windows/Linux/Mac

### Setup

1. **Clone the repository**:
```bash
git clone https://github.com/YOUR_USERNAME/healthcare-predictive-maintenance.git
cd healthcare-predictive-maintenance
```

2. **Install dependencies**:
```bash
pip install -r requirements.txt
```

3. **Install Visual C++ Redistributable** (Windows only):
   - Download from: https://aka.ms/vs/17/release/vc_redist.x64.exe
   - Install and restart your computer

4. **Run the application**:
```bash
streamlit run app.py
```

5. **Access the app**: Open your browser to `http://localhost:8501`

## 📁 Project Structure

```
healthcare-predictive-maintenance/
├── app.py                          # Main Streamlit application
├── requirements.txt                # Python dependencies
├── Medical_Device_Failure_dataset.csv  # Dataset
├── scaler.pkl                      # Feature scaler
├── xgb_maint_class.pkl            # Maintenance class model
├── xgb_failtype.pkl               # Failure type model
├── label_encoders.pkl             # Label encoders
├── tfidf_vectorizer.pkl           # TF-IDF vectorizer
├── svd_transformer.pkl            # SVD transformer
├── kmeans_failtypes.pkl           # KMeans model
├── cluster_keywords.pkl           # Cluster keywords
├── lstm_encoder.keras             # LSTM encoder model
├── Dockerfile                     # Docker configuration
├── Procfile                       # Heroku configuration
└── README.md                      # This file
```

## 🌐 Deployment

### Streamlit Cloud (Recommended)

1. Push your code to GitHub
2. Go to https://share.streamlit.io/
3. Sign in with GitHub
4. Click "New app" and select your repository
5. Deploy!

See `deploy_to_streamlit.md` for detailed instructions.

### Docker

```bash
docker build -t healthcare-app .
docker run -p 8501:8501 healthcare-app
```

### Other Platforms

See `DEPLOYMENT_GUIDE.md` for deployment options including:
- Heroku
- AWS/Azure/GCP
- Standalone executable

## 🧪 Usage

1. **Select Equipment Details**:
   - Device Type, Manufacturer, Model, Country
   - Age, Downtime, Maintenance Cost
   - Maintenance Frequency, Failure Event Count

2. **Optional**: Enter maintenance report text for better predictions

3. **Click "Predict Equipment Health"** to get:
   - Risk assessment (Low/Moderate/High)
   - Confidence score
   - Failure type probabilities
   - Likely failure reasons
   - Similar past maintenance reports

## 📈 Model Architecture

- **LSTM Encoder**: Encodes structured and text features
- **XGBoost Classifier**: Predicts maintenance class (1-3)
- **XGBoost Classifier**: Predicts failure type probabilities
- **TF-IDF + SVD**: Text feature extraction from maintenance reports
- **KMeans Clustering**: Failure type clustering

## 🔧 Troubleshooting

### DLL Load Error (Windows)

Install Microsoft Visual C++ Redistributable:
- Download: https://aka.ms/vs/17/release/vc_redist.x64.exe
- Install and restart

### TensorFlow Import Error

Try installing tensorflow-cpu:
```bash
pip uninstall tensorflow
pip install tensorflow-cpu
```

### Model Files Missing

Ensure all `.pkl` and `.keras` files are in the project directory.

## 📝 License

This project is part of a healthcare analytics course project.

## 👤 Author

**Anieruth Sridhar**

Part of a healthcare predictive maintenance system.

## 🙏 Acknowledgments

- Streamlit for the amazing framework
- TensorFlow/Keras for deep learning
- XGBoost for gradient boosting
- scikit-learn for machine learning utilities

## 📞 Support

For issues or questions:
- Check `SETUP_INSTRUCTIONS.md` for setup help
- Check `DEPLOYMENT_GUIDE.md` for deployment help
- Open an issue on GitHub

---

**Built with ❤️ for Healthcare Analytics**

