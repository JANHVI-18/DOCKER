# 🚀 Docker Networking Experiment: Connecting Containers

This repository provides an in-depth demonstration of how to set up a **custom Docker bridge network** (`net-bridge`) to facilitate seamless **communication** between multiple containers. The experiment focuses on **network isolation**, **container connectivity**, and the essential tools to test inter-container communication.

---

## 🛠 Experiment Overview  
Docker's networking features empower containers to interact securely and efficiently. This experiment demonstrates the following concepts:
1. **Creating a custom bridge network** to enable isolated communication between containers.
2. **Launching multiple containers** within the same custom network.
3. **Verifying connectivity** between containers.
4. **Testing inter-container communication** using both IP addresses and container names.

---

## 🔧 Experiment Setup

### 1️⃣ Create a Custom Docker Network  
Create a new network with a specific subnet and IP range:  
```sh
docker network create --driver bridge --subnet 172.20.0.0/16 --ip-range 172.20.240.0/20 net-bridge
```

### 2️⃣ Launch Containers and Attach Them to the Network

#### 🗄 Run the Redis Database Container  
```sh
docker run -itd --net=net-bridge --name=cont_database redis
```

#### 🖥 Run the Server Container  
```sh
docker run -dit --name server-A --network net-bridge busybox
```

### 3️⃣ Inspect Network and Container Information

#### 🔍 View Network Details  
To inspect the properties of the custom bridge network:  
```sh
docker network inspect net-bridge
```

#### 🔎 Get Container Information  
For a detailed inspection of the database container:  
```sh
docker inspect cont_database
```

#### 🌐 Retrieve Container IP Address  
To fetch the IP address of the `cont_database` container:  
```sh
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cont_database
```

### 4️⃣ Testing Container Connectivity

#### 🖥 Access a Container's Shell  
To enter the shell of the server container:  
```sh
docker exec -it server-A sh
```

#### 🔗 Test Connectivity by IP Address  
Ping the `cont_database` container using its IP address:  
```sh
ping 172.20.240.1  # Replace with actual container IP
```

#### 🔗 Test Connectivity by Container Name  
Ping the `cont_database` container by its name (e.g., `cont_database`):  
```sh
ping cont_database
```

---

## 📌 Key Observations  
✅ The **custom bridge network** allows direct communication between containers.  
✅ Containers are able to communicate using their **assigned IP addresses**.  
✅ **Name resolution** between containers may not work seamlessly with the **BusyBox** container due to its minimalist setup.  
✅ The `docker inspect` command is valuable for retrieving **network details** and **IP addresses** of containers.

---

## 🏁 Conclusion  
This experiment showcases the capabilities of **Docker networking**, focusing on inter-container communication via a **custom bridge network**. Understanding and configuring Docker's networking options is essential when developing microservices or deploying containerized applications effectively.

## 📸 Docker Network Connectivity Test  
Below is a screenshot illustrating the successful test of container-to-container communication via `ping`.

![Docker Ping Test](docker-ping-test.jpg)  
✅ The image above demonstrates the successful interaction between containers through direct IP-based communication.

---
