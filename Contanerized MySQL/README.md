

# 🐳 MySQL Docker Container
![mysql](https://github.com/JANHVI-18/DOCKER/blob/main/Contanerized%20MySQL/Screenshot%202025-03-28%20232808.png)

This repository contains a Docker setup for running a MySQL container with an initial database setup.

## 📌 Features

- ✅ **Pre-configured MySQL Database** – Automatically sets up a MySQL instance.
- ✅ **Database Initialization** – Runs `database.sql` on the first startup.
- ✅ **Easy Setup & Deployment** – Simple commands to build and run.

## 🛠️ Setup Instructions

### 1⃣ Clone the Repository & Navigate to the Directory

Clone the repository and navigate to the project folder:

```bash
git clone https://github.com/JanhviJaiswal/Docker_Practices.git
cd Docker_Practices
```

### 2⃣ Build the Docker Image

Run the following command to build the MySQL Docker image:

```bash
docker build -t mysql-container .
```

### 3⃣ Run the Container

Start a MySQL container using the built image:

```bash
docker run --name mysql-container -d mysql-container
```

### 4⃣ Connect to MySQL

Access the MySQL shell inside the container:

```bash
docker exec -it mysql-container mysql -u root -p
```

➡️ Enter the root password (`root`) when prompted.

### 5⃣ Stop and Remove the Container

To stop the running container:

```bash
docker stop mysql-container
```

To remove the container:

```bash
docker rm mysql-container
```

## 👤 Result

Once the container is running, you can check the database result using the following image:

![Database Result](https://via.placeholder.com/800x400)

## 📂 Project Structure

```
Docker_Practices/
│── database.sql     # SQL script for database initialization
│── Dockerfile       # Docker configuration file
│── README.md        # Project documentation
```

## 📌 Notes

- The `database.sql` file will be executed only on the first run to initialize the database.
- The root password is set to `root`. For security, change this in a production environment.

## 🔗 Repository Link

GitHub: [JanhviJaiswal/Docker_Practices](https://github.com/JanhviJaiswal/Docker_Practices)

## 📜 License

This project is open-source and available for modification. Feel free to contribute! 🚀

---
