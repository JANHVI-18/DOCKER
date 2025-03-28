

---

# 🚢 **Titanic Survival Predictor: Containerized Streamlit App**  

![Titanic Survival Predictor](https://github.com/JANHVI-18/Project-Titanic/blob/main/TITANIC_LIVE.png)  

🔗 **Live Project:** [Click here to open](https://project-titanic-yphgu5az4ryc43bhdotbsl.streamlit.app/)  

---

## 📌 **Overview**  
The **Titanic Survival Predictor** is a machine learning web application that estimates a passenger’s survival probability based on various features. It is built using **Python**, **scikit-learn**, **pandas**, and **Streamlit** for an interactive and user-friendly interface. The application is containerized with **Docker**, ensuring seamless deployment across environments.  

---

## 📂 **Project Structure**  

```bash
Titanic-Prediction-Model/
│── Dockerfile
│── requirements.txt
│── main.py
│── titanic_model.py
│── titanic_model.pkl
│── assets/
│   └── titanic_app_screenshot.png
```

### **📜 Description of Files:**  
- **`main.py`** → Streamlit-based web application for user interaction.  
- **`titanic_model.py`** → Machine learning model training script.  
- **`titanic_model.pkl`** → Pre-trained model stored for predictions.  
- **`requirements.txt`** → Dependencies required to run the application.  
- **`Dockerfile`** → Configuration for containerization using Docker.  
- **`assets/titanic_app_screenshot.png`** → Image for README visualization.  

---

## 🤖 **Model Training (`titanic_model.py`)**  
The model is trained using a **Random Forest Classifier** from `scikit-learn`, leveraging features from the Titanic dataset. The trained model is serialized as **`titanic_model.pkl`** using `joblib`, ensuring efficient loading during deployment.  

### **Training Steps:**  
1. **Load the Titanic dataset**.  
2. **Preprocess missing values** and encode categorical data.  
3. **Train the Random Forest model**.  
4. **Save the trained model** as `titanic_model.pkl`.  

---

## 🎨 **Streamlit Web Application (`main.py`)**  
The web application provides an interactive interface where users can input passenger details and get instant survival predictions.  

### **✨ Features:**  
✔️ **Simple and intuitive UI**  
✔️ **Live predictions using the pre-trained model**  
✔️ **Interactive dropdowns and sliders for input selection**  

---

## 🐳 **Docker Containerization**  
The application is containerized using **Docker** to ensure portability and ease of deployment.  

### **📄 `Dockerfile`**  
```dockerfile
# Use Python 3.12 slim as base image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy necessary files
COPY requirements.txt requirements.txt
COPY main.py main.py
COPY titanic_model.pkl titanic_model.pkl

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the application port
EXPOSE 8501

# Run the Streamlit app
CMD ["streamlit", "run", "main.py", "--server.port=8501", "--server.address=0.0.0.0"]
```

---

## 🚀 **How to Run the Application with Docker**  
Follow these steps to build and run the containerized app:  

### **1️⃣ Navigate to the Project Directory**  
```bash
cd Titanic-Prediction-Model
```

### **2️⃣ Build the Docker Image**  
```bash
docker build -t titanic-prediction .
```

### **3️⃣ Run the Docker Container**  
```bash
docker run -p 8501:8501 titanic-prediction
```

### **4️⃣ Open the Application**  
Go to your browser and visit:  
```
http://localhost:8501
```

---

## 🎯 **Conclusion**  
This project demonstrates how to **deploy a machine learning model** using **Streamlit** and **Docker**. The model predicts Titanic survival outcomes based on user inputs, and containerization ensures seamless deployment.  



⚡ **Happy Coding & Containerizing!** 🐳🚢
