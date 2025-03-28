
# Microservices Architecture with Docker Swarm ⚓️

This guide explains how to deploy a **Microservices Architecture** using **Docker Swarm** with an **API Gateway** and a **Backend Service**.



## 🚀 Step 1: Install Docker & Initialize Docker Swarm

### 1.1 **Install Docker** 🐳

Ensure Docker is installed on your machine. Check the installation by running:

```bash
docker --version
```

If Docker is not installed, download it from [Docker's official website](https://www.docker.com/get-started) and follow the installation instructions.

> **Note**: Make sure Docker Desktop is running for Docker Swarm to work properly.

---

### 1.2 **Initialize Docker Swarm** 🧑‍💻

Start Docker Swarm on your machine by running:

```bash
docker swarm init
```

This will make your machine the **Swarm Manager**.

---

## 📁 Project Structure

The directory structure of your project should look like this:

```plaintext
microservices-docker-swarm/
│── backend-service/
│   ├── backend.py
│   ├── Dockerfile
│
│── api-gateway/
│   ├── api_gateway.py
│   ├── Dockerfile
│
│── docker-compose.yml
│── README.md
```

---

## 🛠️ Step 2: Create the Microservices Code

### **Backend Service** 💡

Create a file named `backend.py`:

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "rajput_tarakk"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
```

### **Backend Dockerfile** 📝

Create the `Dockerfile` for the backend service:

```Dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY backend.py /app
RUN pip install flask
CMD ["python", "backend.py"]
```

---

### **API Gateway Service** 🌐

Create a file named `api_gateway.py`:

```python
from flask import Flask
import requests

app = Flask(__name__)

@app.route('/')
def hello():
    backend_response = requests.get('http://backend-service:5000')
    return f"API Gateway: {backend_response.text}"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
```

### **API Gateway Dockerfile** 📝

Create the `Dockerfile` for the API Gateway:

```Dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY api_gateway.py /app
RUN pip install flask requests
CMD ["python", "api_gateway.py"]
```

---

## 📦 Step 3: Build Docker Images

Build the Docker images for both the **Backend Service** and the **API Gateway**:

```bash
docker build -t backend-service ./backend-service
docker build -t api-gateway ./api-gateway
docker images
```

---

## 📜 Step 4: Create Docker Compose File for Swarm

Create a `docker-compose.yml` file in the root of the project to define services:

```yaml
version: '3.7'

services:
  backend-service:
    image: backend-service
    deploy:
      replicas: 2
      restart_policy:
        condition: on-failure
    networks:
      - app-network
    ports:
      - "5000:5000"

  api-gateway:
    image: api-gateway
    deploy:
      replicas: 2
      restart_policy:
        condition: on-failure
    networks:
      - app-network
    ports:
      - "8080:8080"
    depends_on:
      - backend-service

networks:
  app-network:
    driver: overlay
```

---

## 🚀 Step 5: Deploy the Microservices to Docker Swarm

Deploy the microservices to the Docker Swarm with the following command:

```bash
docker stack deploy -c docker-compose.yml my_microservices
```

> This command will deploy the microservices stack named `my_microservices`.

---

## 📊 Step 6: Verify the Deployment

Check the status of the services:

```bash
docker stack services my_microservices
```

Also, view the running containers with:

```bash
docker ps
```

---

## 🌐 Step 7: Access the Microservices

Open your browser and go to:

```plaintext
http://localhost:8080
```

You should see the response:

```
API Gateway: rajput_tarakk
```

---

## 🔄 Step 8: Scaling the Services

To scale the **Backend Service**, use:

```bash
docker service scale my_microservices_backend-service=5
```

Then verify with:

```bash
docker stack services my_microservices
```

---

## 🛠️ Step 9: Updating the Services

To update the **Backend Service**, follow these steps:

1. Rebuild the backend service image:

```bash
docker build -t backend-service ./backend-service
```

2. Update the backend service with the new image:

```bash
docker service update --image backend-service:latest my_microservices_backend-service
```

---

## 🛑 Step 10: Remove the Stack

When you're finished, remove the stack and leave the Docker Swarm with the following commands:

```bash
docker stack rm my_microservices
docker swarm leave --force
```

---

## 🌟 Conclusion

Congratulations! 🎉 You've successfully deployed a **Microservices Architecture** using **Docker Swarm**, consisting of an **API Gateway** and a **Backend Service**. This architecture allows you to scale and manage microservices efficiently using Docker Swarm!

---

## 📚 Further Reading

- [Docker Swarm Documentation](https://docs.docker.com/engine/swarm/)
- [Flask Documentation](https://flask.palletsprojects.com/en/2.0.x/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)

---

Happy Dockerizing! ⚓️🐳

