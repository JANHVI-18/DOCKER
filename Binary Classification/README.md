# 🌟🍄 Docker Experiment 2: Binary Classification WebApp with Streamlit  

![Binary Classification WebApp](https://via.placeholder.com/800x400)

🚀 Welcome to **Docker Experiment 2!** This project demonstrates the power of Docker to containerize a machine learning web application built using Streamlit. The app classifies mushrooms as either **edible or poisonous** based on input features, utilizing machine learning classifiers.

---

## 🌈✨ Project Overview

- 🌟 **Binary Classification WebApp** designed to predict whether a mushroom is edible or poisonous using various machine learning models.
- 💡 **Classifiers**: Support Vector Machine (SVM), Logistic Regression, and Random Forest.
- 📊 **Evaluation Metrics**: Confusion Matrix, ROC Curve, and Precision-Recall Curve.
- 🐳 **Dockerized App**: Easy deployment with isolated environments.

---

## 📋✅ Prerequisites

Before running the project, ensure you have the following installed:

- 🐳 **Docker**: [Download and install Docker](https://docs.docker.com/get-docker/)
- 🐙 **Docker Compose**: For managing multi-container Docker applications.

---

## 📂 Project Structure

```
/Docker_Practices
├── /Exp-2
    ├── Dockerfile                 # Dockerfile to build the container image
    ├── docker-compose.yml         # Docker Compose configuration file
    ├── app.py                     # Streamlit app for mushroom classification
    ├── requirements.txt           # Python dependencies
    └── mushrooms.csv              # Mushroom dataset for classification
```

---

## 🚀📝 How to Run the Project

### Step 1: 📥 Clone the Repository

```bash
 git clone https://github.com/JANHVI-18/DOCKER.git
 cd Docker_Practices/Exp-2
```

### Step 2: 🛠️ Build the Docker Image

```bash
 docker-compose build
```

This command will read the Dockerfile and build the image for the container.

### Step 3: 📦 Run the Docker Container

```bash
 docker-compose up
```

Your app will be available at: **http://localhost:8501** 🌐

### Step 4: 🌐 Interact with the App

1. **Open your browser** and go to: **http://localhost:8501**
2. **Select a classifier** (SVM, Logistic Regression, or Random Forest) from the sidebar.
3. Adjust the hyperparameters and metrics to visualize (Confusion Matrix, ROC Curve, Precision-Recall Curve).
4. Click **Classify** to see the results and metrics.

### Step 5: 🛑 Stop the Application

```bash
 docker-compose down
```

---

## 🖼️📊 Results

Here is a sample result from the classification output:  

![Binary Classification WebApp](https://via.placeholder.com/800x400)

---

## 🤝 Contributions

Feel free to fork the repository and submit a pull request with your improvements! If you encounter any issues or have feature requests, please open an issue on GitHub.

---

Happy Coding! 🎉🚀✨

