---

# 🐍 Python Logging Application with Docker

This project demonstrates how to build a Python application that continuously logs data to a file and runs within a Docker container. By saving the logs to a Docker volume, this setup guarantees that log data persists even if the container is stopped or removed.

---

## 📁 Project Structure

```plaintext
.
├── app.py            # Python application that generates log entries
└── Dockerfile        # Dockerfile to build the container image
```

---

## 📥 Prerequisites

Before you begin, ensure that Docker is installed on your system:

[Download Docker](https://docs.docker.com/get-docker/)

---

## 🛠️ Instructions for Building and Running the Application

### 🐍 Step 1: Write the Python Logging Application

Create a file named `app.py` with the following code:

```python
import time

# Open or create a log file to write data
with open("/data/app.log", "a") as log_file:
    while True:
        log_file.write(f"App is running at {time.ctime()}\n")
        log_file.flush()  # Ensure the log entry is written immediately
        time.sleep(5)     # Write a new log entry every 5 seconds
```

This script appends a log entry every 5 seconds to `/data/app.log`.

---

### 🛠️ Step 2: Create the Dockerfile

Create a `Dockerfile` with the following content:

```dockerfile
# Use an official Python image as the base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Python application into the container
COPY app.py /app/app.py

# Execute the Python application when the container starts
CMD ["python", "app.py"]
```

---

### 🚀 Step 3: Build the Docker Image

Run the following command to build your Docker image:

```bash
docker build -t python-log-app .
```

This command will generate an image named `python-log-app`.

---

### 🚀 Step 4: Run the Docker Container with a Volume

To make sure the logs are stored persistently, mount a Docker volume and run the container:

```bash
docker run -d -v my-app-data:/data python-log-app
```

Explanation:
- `-d`: Runs the container in detached mode.
- `-v my-app-data:/data`: Mounts the `my-app-data` volume to the `/data` directory inside the container, ensuring persistence of logs.

---

### 🧐 Step 5: Verify Logs

#### 1. **Check if the container is running:**

```bash
docker ps
```

#### 2. **View the container's logs:**

```bash
docker logs <container-id>
```

Replace `<container-id>` with the actual ID of your running container.

#### 3. **Access the log file inside the container:**

```bash
docker exec -it <container-id> sh
cd /data
cat app.log
```

#### 4. **Inspect the volume on your host system:**

```bash
docker volume inspect my-app-data
```

---

## 🧹 Stopping and Cleaning Up

#### 1. **Stop the container:**

```bash
docker stop <container-id>
```

#### 2. **Remove the container:**

```bash
docker rm <container-id>
```

#### 3. **Remove the Docker image (if necessary):**

```bash
docker rmi python-log-app
```

#### 4. **Remove the volume (if needed):**

```bash
docker volume rm my-app-data
```

---

## ⚠️ Notes

- The logs are stored securely and persistently in the Docker volume `my-app-data`.
- Use `docker volume inspect` to find the location of your volume and analyze logs on your host system.

---

### 🚀 Happy Logging with Docker! 🚀

This setup ensures that the Python application continues logging data seamlessly while maintaining persistent logs within a Docker volume, even when the container is stopped or removed.
