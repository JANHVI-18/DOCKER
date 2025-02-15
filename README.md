#🌊 Dockify: A Collection of Docker Experiments 🚀

##🖥️ What is Docker?

Docker is an open-source platform that allows you to automate the deployment of applications within lightweight, portable containers. Containers encapsulate the application and its dependencies, making it easy to run the app in any environment, ensuring consistency across development, testing, and production.


##📌 Overview
This repository contains a collection of Dockerized projects, demonstrating containerization best practices, application deployment, and service orchestration using Docker and Docker Compose. Additionally, pre-built images are hosted on Docker Hub for seamless deployment.

##⚙️ Technologies Used

Docker: For containerizing applications and managing dependencies.
Docker Compose: For managing multi-container applications.
Python: Programming language used in most experiments.
Streamlit: Framework for building data-centric web applications.
MySQL / PostgreSQL: Relational databases used in some experiments.
Evidently AI: Tool for monitoring machine learning models in production.


##🔨 Installation
To get started with the experiments in this repository, follow these simple installation steps:

1. Prerequisites
Ensure that the following tools are installed:

Docker: Install Docker from here.
Docker Compose: Install Docker Compose from here.
Git: Make sure Git is installed. Download it here.
2. Clone the Repository
Clone the repository to your local machine:


3. Running the Experiments
Navigate to the folder of the experiment you'd like to explore (e.g., streamlit_postgresql) and follow the specific instructions provided there.

For most experiments:

bash
Copy
Edit
cd streamlit_postgresql
docker build -t streamlit-postgres .
docker run -p 8501:8501 streamlit-postgres
For multi-container setups, use Docker Compose:

bash
Copy
Edit
docker-compose up
This will bring up the necessary containers for the experiment.




