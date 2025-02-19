# Docker Experiment 2: Mushroom Classification WebApp with Streamlit

Welcome to **Docker Experiment 2**! This project showcases the power of **Docker** to containerize a **machine learning web application** built using **Streamlit**. The app classifies mushrooms as either **edible** or **poisonous** based on input features, leveraging popular machine learning classifiers.

---

## 🚀 Project Overview

This project involves a **Binary Classification WebApp** that predicts whether a mushroom is edible or poisonous using machine learning algorithms. The app offers a choice of classifiers, including **Support Vector Machine (SVM)**, **Logistic Regression**, and **Random Forest**.

### Key Features:
- **Interactive User Interface** created with **Streamlit** for real-time classification and visualization.
- **Multiple Classifiers**: Choose from **SVM**, **Logistic Regression**, or **Random Forest**.
- **Evaluation Metrics**: View **Confusion Matrix**, **ROC Curve**, and **Precision-Recall Curve**.
- **Dockerized Environment**: Ensures easy deployment with an isolated container.

---

## 📝 Prerequisites

To run the project, ensure that the following tools are installed on your system:

- **Docker**: [Download Docker here](https://www.docker.com/get-started)
- **Docker Compose**: Useful for managing multi-container Docker applications.

---

## 📂 Project Structure

```plaintext
/Docker_Practices
├── /Exp-2
    ├── Dockerfile                 # Dockerfile to build the image for the container
    ├── docker-compose.yml         # Configuration for managing Docker containers
    ├── app.py                     # Streamlit app for mushroom classification
    ├── requirements.txt           # Required Python dependencies
    └── mushrooms.csv              # Dataset used for mushroom classification
```

---

## 🚀 How to Run the Project

Follow the steps below to get the app up and running locally.

### Step 1: Clone the Repository

First, clone this repository to your local machine:

```bash
git clone https://github.com/Aditya5757raj/Docker_Practices.git
cd Docker_Practices/Exp-2
```

### Step 2: Build the Docker Image

Build the Docker image by running:

```bash
docker-compose build
```

This will read the `Dockerfile` and create the Docker image for the container.

### Step 3: Run the Docker Container

After building the image, start the container using:

```bash
docker-compose up
```

The app will be available at [http://localhost:8501](http://localhost:8501).

### Step 4: Interact with the WebApp

Open your browser and go to [http://localhost:8501](http://localhost:8501).
- Select a classifier (SVM, Logistic Regression, or Random Forest) from the sidebar.
- Adjust hyperparameters and choose evaluation metrics (Confusion Matrix, ROC Curve, Precision-Recall Curve).
- Click **Classify** to see the results and corresponding evaluation metrics.

### Step 5: Stop the Application

To stop the Docker container:

```bash
docker-compose down
```

---

## 🧑‍💻 Additional Docker Commands

Here are some useful commands to manage and monitor your Docker containers:

### Check Running Containers

To check if your container is running, use:

```bash
docker ps
```

This will list all running containers with their status and exposed ports.

### View Logs

To view logs of the running container (useful for debugging):

```bash
docker-compose logs
```

For specific container logs:

```bash
docker-compose logs <service_name>
```

Example:

```bash
docker-compose logs dockerex2
```

### Running Docker Compose in Detached Mode

To run the containers in the background (detached mode):

```bash
docker-compose up -d
```

This starts the containers in the background, allowing you to use the terminal for other tasks.

### Stopping Containers

To stop all running containers:

```bash
docker-compose down
```

Alternatively, stop just the app container:

```bash
docker-compose stop dockerex2
```

### Rebuild and Restart Containers

If you modify the Dockerfile or configurations, rebuild and restart the containers with:

```bash
docker-compose up --build
```

This command rebuilds the images and restarts the containers with the updated settings.

### Clean Up Unused Containers and Images

To remove stopped containers and unused images:

```bash
docker system prune
```

Be cautious with this command, as it will delete unused data. To remove unused images only:

```bash
docker image prune
```

---

## 🛠 Dockerfile Explanation

The `Dockerfile` creates an optimized Docker image for this web application. Here's a breakdown of its components:

- **Base Image**: Uses `python:3-slim` for a lightweight Python environment.
- **Install Dependencies**: Installs the necessary libraries from `requirements.txt`.
- **Working Directory**: Sets `/app` as the working directory inside the container.
- **Non-root User**: Runs the app as a non-root user for security.
- **Port Exposure**: Exposes port `8501` for Streamlit to serve the web application.
- **Run Command**: Launches the app with `streamlit run app.py`.

---

## 🧑‍💻 Dependencies

This app relies on the following Python libraries:

- **pandas**: For data manipulation and processing.
- **streamlit**: For building the interactive web interface.
- **scikit-learn**: For machine learning models and evaluation metrics.
- **matplotlib**: For creating visualizations.
- **seaborn**: For additional data visualizations.

---

## 🤝 Contributing

Feel free to fork the repository and submit pull requests with improvements! If you encounter any issues or have feature suggestions, open an issue on GitHub.

---

### Happy Coding! 🎉

---

## Streamlit Python Code for Mushroom Classification

```python
import streamlit as st
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC
from sklearn.linear_model import LogisticRegression
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import confusion_matrix, roc_curve, auc, precision_recall_curve
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset
@st.cache
def load_data():
    return pd.read_csv('mushrooms.csv')

data = load_data()

# Show dataset in the app
st.write("Mushroom Dataset", data.head())

# Features and target column
X = data.drop(columns=["class"])
y = data["class"]

# Split the data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Sidebar: Classifier selection
classifier_option = st.sidebar.selectbox("Select Classifier", ("SVM", "Logistic Regression", "Random Forest"))

# Initialize classifier
if classifier_option == "SVM":
    model = SVC(probability=True)
elif classifier_option == "Logistic Regression":
    model = LogisticRegression()
else:
    model = RandomForestClassifier()

# Train the model
model.fit(X_train, y_train)

# Make predictions
y_pred = model.predict(X_test)
y_proba = model.predict_proba(X_test)[:, 1]

# Display the evaluation metrics
st.write(f"Confusion Matrix for {classifier_option}")
cm = confusion_matrix(y_test, y_pred)
sns.heatmap(cm, annot=True, fmt="d", cmap="Blues", xticklabels=model.classes_, yticklabels=model.classes_)
plt.title("Confusion Matrix")
st.pyplot()

# ROC Curve
fpr, tpr, _ = roc_curve(y_test, y_proba)
roc_auc = auc(fpr, tpr)
st.write(f"ROC AUC for {classifier_option}: {roc_auc:.2f}")
plt.figure()
plt.plot(fpr, tpr, color="darkorange", lw=2, label="ROC curve (area = %0.2f)" % roc_auc)
plt.plot([0, 1], [0, 1], color="navy", lw=2, linestyle="--")
plt.xlim([0.0, 1.0])
plt.ylim([0.0, 1.05])
plt.xlabel("False Positive Rate")
plt.ylabel("True Positive Rate")
plt.title("Receiver Operating Characteristic")
plt.legend(loc="lower right")
st.pyplot()

# Precision-Recall Curve
precision, recall, _ = precision_recall_curve(y_test, y_proba)
st.write(f"Precision-Recall Curve for {classifier_option}")
plt.figure()
plt.plot(recall, precision, color="blue", lw=2, label="Precision-Recall curve")
plt.xlabel("Recall")
plt.ylabel("Precision")
plt.title("Precision-Recall Curve")
plt.legend(loc="lower left")
st.pyplot()
```

---

## Dockerfile

```dockerfile
# Use a lightweight Python image
FROM python:3-slim

# Prevent Python from generating .pyc files
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install the required dependencies
COPY requirements.txt . 
RUN pip install --no-cache-dir -r requirements.txt

# Set the working directory to /app
WORKDIR /app
COPY . /app

# Create a non-root user and ensure proper file permissions
RUN adduser --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# Expose the default Streamlit port
EXPOSE 8501

# Command to run the Streamlit app
CMD ["streamlit", "run", "app.py"]
```

---

## requirements.txt

```txt
pandas
streamlit
scikit-learn
matplotlib
seaborn
```
