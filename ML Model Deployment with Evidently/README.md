

# 🚀 **ML Model with Evidently - Dockerized Streamlit App**

Welcome to the **ML Model with Evidently** repository! This project demonstrates how to easily containerize and deploy a machine learning (ML) model using **Streamlit** and **Evidently AI**. The setup is designed to provide a seamless environment for deploying your ML model within a Docker container.

---

## 📌 **Overview**

This repository includes a **Dockerized Streamlit app** for running a machine learning model with the **Evidently AI** integration. The goal is to make the process of deploying and executing your model simple, secure, and fast.

### Key Features:
- 🔄 **Easily deploy ML models** within Docker containers.
- 📊 **Real-time metrics and monitoring** using Evidently AI.
- 💡 **Interactive Streamlit dashboard** for visualizing the model’s performance.

---

## 📂 **Project Structure**

Here’s how the project is organized:

```plaintext
📦 Docker_Practices
├── 📂 app               # Streamlit application
├── 📂 projects          # ML model & related files
├── 📜 requirements.txt  # Python dependencies
├── 📜 Dockerfile        # Docker configuration
└── 📜 app.py            # Main Streamlit application
```

---

## 🛠️ **Setup & Installation**

### 🔹 **Clone the Repository**

Start by cloning the repository to your local machine:

```bash
git clone https://github.com/Aditya5757raj/Docker_Practices.git
cd Docker_Practices
```

### 🔹 **Build & Run the Docker Container**

Build the Docker image for your Streamlit ML app:

```bash
docker build -t streamlit-ml-app .
```

Then, run the Docker container to launch your app:

```bash
docker run -p 8501:8501 streamlit-ml-app
```

---

## 📌 **Usage**

Once the container is up and running, open **[http://localhost:8501](http://localhost:8501)** in your web browser. You’ll be able to interact with the Streamlit dashboard that visualizes your ML model’s performance and metrics powered by **Evidently AI**. 📊

---

## 📸 **Result**

Here’s an example of the Streamlit dashboard output:

  
*Example: Dashboard showing real-time ML metrics.*

✅ **The Streamlit dashboard** provides an intuitive interface to monitor your ML model’s health and performance!

---



Feel free to explore and enhance the project further! 🎉 Let me know if you need more help with it!
