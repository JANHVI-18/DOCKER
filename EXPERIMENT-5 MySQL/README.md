# 🐳 MySQL Docker Container Setup

This project provides a **Dockerized MySQL environment**, perfect for running MySQL with an **initial database setup**. Whether you're starting a new project or practicing Docker, this repository helps you quickly set up a MySQL container with pre-configured settings.

---

## 📌 Key Features  
✅ **Pre-Configured MySQL Instance** – Easily deployable MySQL instance.  
✅ **Automatic Database Initialization** – Runs `database.sql` on the first container startup.  
✅ **Quick Setup & Execution** – Simple steps to build and run the container without hassle.  

---

## 🛠️ Installation & Setup

### 1️⃣ Clone the Repository & Navigate to Project Directory  
First, clone the repository and go to the project folder:  
```sh
git clone https://github.com/Aditya5757raj/Docker_Practices.git
cd Docker_Practices
```

### 2️⃣ Build the MySQL Docker Image  
To create the MySQL image, run the following command:  
```sh
docker build -t mysql-container .
```

### 3️⃣ Launch the MySQL Container  
Start the MySQL container based on the built image:  
```sh
docker run --name mysql-container -d mysql-container
```

### 4️⃣ Connect to MySQL Database  
To access the MySQL shell inside the container, use this command:  
```sh
docker exec -it mysql-container mysql -u root -p
```
➡️ When prompted, enter the **root password** (`root`).

### 5️⃣ Stopping and Removing the Container  
To **stop** the container:  
```sh
docker stop mysql-container
```
To **remove** the container:  
```sh
docker rm mysql-container
```

---

## 📂 Project Directory Structure  

```
Docker_Practices/
│── database.sql  # SQL file to initialize the database
│── Dockerfile    # Docker setup configuration file
│── README.md     # Documentation for the project
```

---

## 📌 Important Notes  
- The `database.sql` file will execute only **on the first run** to set up the initial database.  
- The **root password** is set as `root` (please modify this for production environments).  

---



---

### 📜 License  
This project is **open-source** and available for modification. Feel free to contribute or customize it! 🚀

---

With this Docker setup, you can seamlessly integrate MySQL into your local or cloud environment with minimal configuration and effort. Ideal for testing, development, and educational purposes.
