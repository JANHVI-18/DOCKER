

# 🚀 Docker Playground 🐳 – Build, Test, Deploy, Repeat! 🔄

Welcome to the **Docker Playground**! This repository contains a series of Dockerized applications and experiments that demonstrate the power of containerization. From **simple Hello World** containers to **microservices architectures**, this is where you can explore Docker in action.

---

## 🌟 What is Docker?

**Docker** is a powerful platform for developing, shipping, and running applications inside containers. Containers bundle your app and its dependencies together, ensuring it works on any machine—whether it’s your local laptop, a server, or in the cloud. Docker simplifies deployment, improves scalability, and ensures consistent environments across the development lifecycle.

---

## 🛠 Why Use Docker?

- **Consistency**: Run your app the same way, anywhere.
- **Portability**: Easily move apps between development, testing, and production environments.
- **Efficiency**: Containerized apps consume fewer resources than traditional virtual machines.
- **Isolation**: Containers allow apps to run without interfering with each other, even on the same machine.
- **Easy Scaling**: Docker integrates seamlessly with orchestration tools like Docker Swarm and Kubernetes to scale your applications efficiently.

---

## 🧪 Docker Experiments

Here’s an overview of the different Docker experiments in this repo:

### 1. **Bakery Foundation Example on Windows 🍞**
   - **Description**: A simple Docker example demonstrating how to run a bakery-themed application on a Windows-based Docker engine.
   - **Key Learning**: Docker's cross-platform capabilities.
   - **Instructions**: Clone the repo and follow the Windows-specific setup to build the Bakery app inside a container.

### 2. **Binary Classification ⚙️**
   - **Description**: A Dockerized machine learning application built with Streamlit for binary classification using logistic regression.
   - **Key Learning**: How to containerize machine learning applications.
   - **Instructions**: `docker build -t binary-classifier .` and `docker run -p 8501:8501 binary-classifier`.

### 3. **Containerized MySQL 🗄️**
   - **Description**: Setting up a MySQL database inside a Docker container for easy management and scalability.
   - **Key Learning**: Working with databases inside containers.
   - **Instructions**: Follow the instructions to create a MySQL container and connect it to your applications.

### 4. **Docker Bake 🍰**
   - **Description**: A feature of Docker for automating the process of building complex applications with multiple containers.
   - **Key Learning**: Streamlining multi-container setups with Docker Bake.
   - **Instructions**: `docker buildx bake` to initiate complex builds.

### 5. **Docker Bridge 🌐**
   - **Description**: Experimenting with Docker’s bridge network mode to connect containers.
   - **Key Learning**: Networking between Docker containers.
   - **Instructions**: Set up multiple containers using Docker's bridge mode for inter-container communication.

### 6. **Hello World! 🌍**
   - **Description**: The classic “Hello World” Docker app, which demonstrates the basic setup of a Docker container with a simple web application.
   - **Key Learning**: Basic understanding of Docker images and containers.
   - **Instructions**: `docker run hello-world`.

### 7. **ML Model Deployment with Evidently 🤖**
   - **Description**: Deploying an ML model using **Evidently AI** for model monitoring inside a Docker container.
   - **Key Learning**: How to monitor machine learning models and track metrics in production.
   - **Instructions**: Set up an ML model container and track performance metrics.

### 8. **Microservices Architecture using Docker Swarm ⚓**
   - **Description**: Building a microservices architecture with Docker Swarm to orchestrate multiple containers.
   - **Key Learning**: Managing microservices at scale with Docker Swarm.
   - **Instructions**: Learn how to set up a scalable microservices architecture.

### 9. **Postgres and Streamlit 🔗**
   - **Description**: A Docker-based project that connects **Streamlit** with a **PostgreSQL database**.
   - **Key Learning**: Dockerizing apps with backend databases.
   - **Instructions**: Set up Streamlit and Postgres within Docker and link them.

### 10. **Project: Binary-Classification Webpage 🔍**
   - **Description**: A webpage that runs a binary classification model inside Docker.
   - **Key Learning**: Deploying ML models with Docker and creating a web interface.
   - **Instructions**: Clone, build, and run the container to launch the classification app.

### 11. **Project: Streamlit Dashboard 📊**
   - **Description**: A dynamic **Streamlit** dashboard to visualize real-time data in a Docker container.
   - **Key Learning**: Containerizing interactive data visualization applications.
   - **Instructions**: Set up a Streamlit app inside Docker to create a live dashboard.

---

## 🧑‍💻 How to Clone This Repo and Get Started

To clone the **Docker Playground** repository and get started with the experiments, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/JANHVI-18/DOCKER.git
   cd DOCKER
   ```

2. Each experiment has its own folder and specific instructions. For example, to start the **Binary Classification WebApp**, follow the instructions in the folder `Binary-Classification/README.md`.

3. Build and run the container for any project:

   ```bash
   docker build -t <image-name> .
   docker run -p <port>:<port> <image-name>
   ```

   Replace `<image-name>` with the project-specific image name and `<port>` with the required port.

---

## 🎯 Achievements

By working on these Docker experiments, I have:

- Gained hands-on experience in building and deploying Dockerized applications.
- Worked with different Docker tools like **Docker Swarm**, **Docker Bake**, and **Bridge Networks**.
- Deployed machine learning models and web apps inside containers, simplifying their deployment.
- Built scalable, microservices architectures using Docker for efficient application management.

---

## 🤝 Contributions

I welcome contributions to enhance this project. If you find a bug, have an idea for a new experiment, or would like to improve the existing projects, feel free to:

- **Open an issue**: Report bugs or request features.
- **Submit a pull request**: Help improve the code, documentation, or add new experiments.
- **Improve the docs**: Help others by contributing to the documentation.

---

### 🔥 **Happy Learning & Containerizing with Docker!** 🐳🚀


