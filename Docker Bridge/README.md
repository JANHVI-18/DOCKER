

# 🚀 **Docker Network Experiment**

Welcome to the **Docker Network Experiment** repository! This project demonstrates how to create and test a custom Docker network (`net-bridge`) for seamless inter-container communication. Dive into Docker’s networking capabilities and explore how containers can communicate securely in a user-defined bridge network. 🛠️

---

## 🛠 **Experiment Overview**

Docker's networking features provide powerful tools for container-to-container communication. In this experiment, you'll:

🔌 **Create** a custom bridge network for isolated communication.  
💻 **Run** multiple containers within this network.  
🔍 **Inspect** and verify connectivity between containers.  
💬 **Test** inter-container communication via ping and name resolution.

---

## 🔧 **Experiment Setup**

### 1️⃣ **Create a Custom Docker Network** 🌐

Start by creating a custom bridge network, `net-bridge`, using the following command:

```bash
docker network create --driver bridge --subnet 172.20.0.0/16 --ip-range 172.20.240.0/20 net-bridge
```

### 2️⃣ **Run Containers and Attach to the Network** 🖥️

Now, launch the containers that will be part of this network:

#### 🗄 **Run Database Container (Redis)** 🛠️

```bash
docker run -itd --net=net-bridge --name=cont_database redis
```

#### 💻 **Run Server Container (BusyBox)** 🖥️

```bash
docker run -dit --name server-A --network net-bridge busybox
```

### 3️⃣ **Inspect Network and Containers** 🔍

#### 🔎 **Check Network Details**

To inspect the details of the custom network:

```bash
docker network inspect net-bridge
```

#### 🔍 **Check Container Details**

Get detailed information about the `cont_database` container:

```bash
docker inspect cont_database
```

#### 🌐 **Get Container IP Address**

Find the IP address of the `cont_database` container:

```bash
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cont_database
```

### 4️⃣ **Testing Connectivity** 🔗

#### 🖥️ **Access Container Shell**

Enter the shell of the `server-A` container:

```bash
docker exec -it server-A sh
```

#### 🔗 **Ping Another Container by IP**

To ping the `cont_database` container by its IP address:

```bash
ping 172.20.240.1  # Replace with the actual IP of the container
```

#### 🔗 **Ping Another Container by Name**

Alternatively, ping the container using its name:

```bash
ping cont_database
```

---

## 📌 **Observations** 📊

✅ **Direct Communication Between Containers**  
The custom bridge network allows direct communication between containers, ensuring secure and isolated communication. 🔒

✅ **IP Address Communication**  
Containers communicate using their assigned IP addresses, ensuring that each container can access and interact with the others. 🌍

✅ **Limited Name Resolution**  
While name resolution (ping by container name) works in most cases, it may be limited with minimal containers like `busybox` due to its DNS capabilities. 🧩

✅ **Useful Docker Commands**  
Commands like `docker inspect` and `docker network inspect` help you retrieve network and IP details, which are crucial for troubleshooting. ⚙️

---

## 🏁 **Conclusion** 🎯

This experiment showcases Docker’s powerful networking features, particularly custom bridge networks for inter-container communication. Mastering Docker networking is essential for efficiently deploying microservices and containerized applications, allowing you to scale and secure your architecture. 🔧

---

## 📸 **Docker Network Connectivity Test** 📈

Here’s a screenshot of the experiment in action:

![Docker Network Test](https://via.placeholder.com/800x400)

✅ **The image above** demonstrates successful communication between containers using `ping`, confirming the proper setup of the custom bridge network. 🏆

---

Feel free to experiment with this setup and explore Docker networking in your projects! 🐳

---

