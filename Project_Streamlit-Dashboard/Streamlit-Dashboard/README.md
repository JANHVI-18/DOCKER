# 📊 Streamlit Dashboard: Interactive Data Visualization

## 🔗 Live Project: [Click here to open](https://project-appdashboard-nzxanxxdwwpzewudewe87u.streamlit.app/)

![Dashboard Preview](https://github.com/JANHVI-18/Project-Streamlit_Dashboard/blob/main/Streamlit_dashboard%20(2).png)

## 📌 Overview
The **Streamlit Dashboard** is a web-based data visualization tool built using **Streamlit, Pandas, and Matplotlib**. It enables users to explore datasets interactively, generate insightful visualizations, and gain meaningful insights. The application is **containerized with Docker**, ensuring easy deployment and scalability.

---

## 📂 Project Structure
```
Streamlit-Dashboard/
│── Dockerfile
│── requirements.txt
│── app.py
│── data/
│   ├── sample_data.csv
│── assets/
│   ├── dashboard_screenshot.png
│── utils/
│   ├── data_processing.py
│── README.md
```

### 📜 Description of Files:
- **`app.py`** → Main Streamlit application script.
- **`data/sample_data.csv`** → Sample dataset for testing and visualization.
- **`utils/data_processing.py`** → Helper functions for data preprocessing.
- **`requirements.txt`** → List of dependencies required to run the application.
- **`Dockerfile`** → Configuration file for Docker containerization.
- **`assets/dashboard_screenshot.png`** → Screenshot of the dashboard for README visualization.

---

## 🎨 Streamlit Web Application (`app.py`)
The web application provides an interactive interface where users can:
✔️ Upload and visualize datasets.  
✔️ Generate dynamic charts and graphs.  
✔️ Filter data using interactive widgets.  
✔️ Export processed insights for further analysis.  

### ✨ Features:
✔️ **User-Friendly UI** with real-time updates.  
✔️ **Interactive Charts** using Matplotlib & Seaborn.  
✔️ **CSV Upload Support** for custom dataset analysis.  
✔️ **Customizable Filters** to refine insights.  

---

## 🐳 Docker Containerization
The application is **containerized** using Docker for easy deployment and portability.

### 📄 Dockerfile
```dockerfile
# Use Python 3.12 slim as base image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy necessary files
COPY requirements.txt requirements.txt
COPY app.py app.py
COPY data/sample_data.csv data/sample_data.csv
COPY utils/ utils/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the application port
EXPOSE 8501

# Run the Streamlit app
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
```

---

## 🚀 How to Run the Application with Docker
Follow these steps to build and run the containerized app:

### 1️⃣ Navigate to the Project Directory
```bash
cd Streamlit-Dashboard
```

### 2️⃣ Build the Docker Image
```bash
docker build -t streamlit-dashboard .
```

### 3️⃣ Run the Docker Container
```bash
docker run -p 8501:8501 streamlit-dashboard
```

### 4️⃣ Open the Application
Visit the following URL in your browser:

➡️ [http://localhost:8501](http://localhost:8501)

---

## 🎯 Conclusion
This **Streamlit Dashboard** project demonstrates how to build an interactive data visualization web app with **Python, Pandas, and Matplotlib**. **Containerization with Docker** ensures a hassle-free deployment experience across different environments.

⚡ **Happy Coding & Visualizing!** 📊🚀

