
# Hello World in Docker 🌍🚀

![Hello World Docker](https://image.shutterstock.com/image-vector/docker-logo-icon-symbol-illustration-260nw-1816593893.jpg)

This guide will walk you through deploying a simple **Hello World!** application in Python using **Docker**. We'll create a `Dockerfile`, build the Docker image, and run it as a container. Let's get started! 🎉

## Prerequisites 🛠️

Before you begin, make sure you have the following tools installed:

- **Docker** installed on your system.  
  You can download and install Docker from [here](https://www.docker.com/get-started). 🐳
  
- **Python 3** installed on your machine.  
  Check by running:  
  ```bash
  python3 --version
  ```

## Steps to Deploy 🚀

### 1. **Create `app.py`** 💻

Create a Python script named `app.py` that contains the simple "Hello World!" program.

```python
# app.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World! 👋'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

### 2. **Create `Dockerfile`** 📝

Next, create a `Dockerfile` that will contain instructions for building the Docker image.

```Dockerfile
# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside the container
EXPOSE 5000

# Define environment variable
ENV FLASK_APP=app.py

# Run app.py when the container launches
CMD ["flask", "run", "--host=0.0.0.0"]
```

### 3. **Create `requirements.txt`** 📄

Create a `requirements.txt` file that lists the necessary dependencies for the project.

```
flask
```

### 4. **Build the Docker Image** 🏗️

Open your terminal and navigate to the directory where `app.py`, `Dockerfile`, and `requirements.txt` are located.

Run the following command to build your Docker image:

```bash
docker build -t hello-world-docker .
```

> The `-t hello-world-docker` flag names the image "hello-world-docker."

### 5. **Run the Docker Container** 🚢

Once the image is built, run the following command to start the container:

```bash
docker run -p 5000:5000 hello-world-docker
```

This will start the container and map port `5000` from the container to port `5000` on your machine.

### 6. **Access the Application** 🌍

Now open your web browser and navigate to:

```
http://localhost:5000
```

You should see the message:  
```
Hello World! 👋
```

### 7. **Stop the Container** 🛑

To stop the Docker container, press `Ctrl + C` or run the following command in another terminal:

```bash
docker ps
```

This will show you the running containers. To stop the container, use the `docker stop` command followed by the container ID:

```bash
docker stop <container_id>
```

---

## Troubleshooting 🛠️

- **Flask App Not Running**:  
  If you don’t see the "Hello World!" message, ensure that Flask is installed correctly by checking the `requirements.txt` file and confirming the app is running on the correct port.
  
- **Port Conflict**:  
  If you already have a service running on port `5000`, change the exposed port in the `Dockerfile` and the `docker run` command to another port, like `8000`.

---

## Clean Up 🧹

Once you're done, clean up your Docker environment by removing the Docker container and image.

```bash
docker rm <container_id>  # Remove the container
docker rmi hello-world-docker  # Remove the image
```

---

## Conclusion 🎉

Congratulations! 🎉 You’ve successfully deployed a **Hello World!** app using **Python** and **Docker**. This simple example can be expanded to build more complex web applications with Docker.

---

## Further Reading 📚

- [Docker Documentation](https://docs.docker.com/)
- [Flask Documentation](https://flask.palletsprojects.com/en/2.0.x/)

---

Happy Dockerizing! 🚢

