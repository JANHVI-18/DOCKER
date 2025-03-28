
# 🍄 Binary Classification Webpage: Containerized Streamlit App

![ Binary Classification Webpage](https://github.com/JANHVI-18/Binary-Classification-Webpage/blob/main/Binary-Classification-webpage.png)  

🔗 **Live Project:** [Click here to open](https://binary-classification-webpage-6zgoztdy9mrfcyqdyupqqu.streamlit.app/)  

## 📌 Overview
The **Mushroom Classification Predictor** is a machine learning web application that predicts whether a mushroom is poisonous or edible based on various input features. This project utilizes **Python**, **scikit-learn**, **pandas**, and **Streamlit** for the web interface. The application is containerized using **Docker** for portability and easy deployment.

## 📂 Project Structure

```plaintext
Mushroom-Classification-Model/
│── Dockerfile
│── requirements.txt
│── app.py
│── mushrooms.csv
```

### 📜 Description of Files:
- **app.py**: The Streamlit-based web application for user interaction.
- **mushrooms.csv**: The dataset used for training the machine learning model. It contains features and labels to classify mushrooms as either poisonous or edible.
- **requirements.txt**: A list of dependencies required to run the application.
- **Dockerfile**: The configuration file for containerizing the application using Docker.

## 🤖 Model Training (`app.py`)
The model is trained using algorithms like **Logistic Regression**, **Random Forest Classifier**, or **Support Vector Machine (SVM)** from **scikit-learn**. After training, the model is saved within the **app.py** file and is used to make predictions based on user input.

### Steps in `app.py`
1. **Load the dataset** (`mushrooms.csv`).
2. **Preprocess** missing values and encode categorical features.
3. **Train the model** using a selected algorithm (e.g., Random Forest).
4. **Display the model's performance** (accuracy, precision, recall, etc.).
5. **Predict whether a mushroom is edible or poisonous** based on user input.

## 🐳 Docker Setup
To containerize the application, the **Dockerfile** is used.

### 📄 Dockerfile

```dockerfile
# Use Python 3.12 slim as base image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy necessary files
COPY requirements.txt requirements.txt
COPY app.py app.py
COPY mushrooms.csv mushrooms.csv

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the application port
EXPOSE 8501

# Run the Streamlit app
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
```

## 🚀 Running the Application with Docker
Follow these steps to build and run the containerized application:

1️⃣ **Navigate to the Project Directory**

```bash
cd Mushroom-Classification-Model
```

2️⃣ **Build the Docker Image**

```bash
docker build -t mushroom-classification .
```

3️⃣ **Run the Docker Container**

```bash
docker run -p 8501:8501 mushroom-classification
```

4️⃣ **Access the Application**
Open your browser and navigate to:

```plaintext
http://localhost:8501
```

## 🎯 Conclusion
This project demonstrates how to deploy a **binary classification** machine learning model using **Streamlit** and **Docker**. Users can input various mushroom features and predict whether a mushroom is poisonous or edible. The application also provides real-time predictions and model performance metrics.

## 🔥 Next Steps:
- 🚀 Deploy the containerized app to **AWS**, **GCP**, or **Vercel**.
- 🎨 Enhance the UI with advanced **Streamlit** widgets and visualizations.
- 🧠 Improve the model's accuracy with additional feature engineering or algorithm tuning.
- ⚡ **Happy Coding & Containerizing!** 🐳🚀

---

