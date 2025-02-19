
# 🌟 **Streamlit Spiral Visualization App with Docker**

Welcome to the **Streamlit Spiral Visualization App**! This project demonstrates an interactive Python application built with **Streamlit** to visualize a dynamic spiral. Customize the spiral’s characteristics using adjustable sliders and view the changes in real-time. The app is fully **Dockerized** for easy deployment and ensures consistency across different environments.

---

## 🚀 **Features**

- **Interactive Controls**: Adjust the number of points and turns in the spiral using sliders.
- **Dynamic Visualization**: View the spiral change instantly as you move the sliders.
- **Dockerized App**: The app is contained in a Docker image for portability and easy deployment across platforms.

---

## 🛠 **Technologies Used**

- **Python 3**: The core programming language for the app.
- **Streamlit**: The framework used to build the interactive web application.
- **Altair**: A powerful declarative statistical visualization library used for rendering the spiral.
- **Docker**: Containerizes the app, ensuring it runs the same in all environments.
- **Pandas**: Used to manipulate and handle data in DataFrame format, providing structured input for visualization.

---

## ⚙ **Prerequisites**

Before you start, ensure you have the following tools installed on your machine:

- **Docker**: For building and running the application in a containerized environment.  
  [Docker Installation Guide](https://docs.docker.com/get-docker/)
  
- **Git**: To clone the repository.

---

## 🛠 **Getting Started**

Follow these steps to set up and run the Streamlit app, either locally or in a Docker container.

### Step 1: **Clone the Repository**

Clone the repository to your local machine by running:

```bash
git clone https://github.com/Aditya5757raj/Docker_Practices
cd Docker_Practices
```

---

### Step 2: **Create the `requirements.txt` File**

Make sure the project directory contains the `requirements.txt` file with the following dependencies:

```txt
streamlit
altair
pandas
```

---

### Step 3: **Build the Docker Image**

Build the Docker image using the `Dockerfile`:

```bash
docker build -t streamlit .
```

This command will create a Docker image named `streamlit`.

---

#### **Check if the Image is Built**

After building the image, verify its creation by:

- **Using Docker Desktop**: Go to the **Images** section to confirm that the `streamlit` image is listed.

- **Using Command Line**: Run the following command to list all Docker images:

```bash
docker images
```

This will display all available Docker images, including `streamlit`.

---

### Step 4: **Run the Docker Container**

Run the app inside a Docker container using:

```bash
docker run -p 8501:8501 streamlit
```

This command maps port `8501` inside the Docker container to port `8501` on your local machine.

---

### Step 5: **Access the Streamlit App**

Once the container is running, open your browser and go to:

```
http://localhost:8501
```

The Streamlit app will load, allowing you to interactively adjust the spiral’s number of points and turns.

---

## 🌀 **How the App Works**

### **Sliders for Customization**

- **Number of points in the spiral**: This slider controls how many points form the spiral.
- **Number of turns in the spiral**: This adjusts how many full turns the spiral will make.

### **Real-Time Visualization**

As you modify the slider values, the spiral is updated dynamically, providing an interactive experience.

### **Under the Hood**

The app generates spiral points using **polar coordinates**. For each point, the **x** and **y** coordinates are calculated using mathematical functions. These values are rendered using **Altair** charts in the Streamlit interface.

---

## 💻 **Code Explanation**

### **NamedTuple for Points**

The spiral points are stored as `Point` objects (with `x` and `y` coordinates), leveraging Python's `namedtuple` to maintain immutability.

### **Generating Spiral Data**

- The total number of points and turns is used to compute the spiral coordinates.
- The angle for each point is calculated using polar coordinates.

### **Streamlit Visualization**

The `spiral_df` DataFrame is passed to **Altair**, which then generates a scatter plot to represent the spiral.

---

## 🛠 **Troubleshooting**

If you face any issues, consider the following solutions:

1. **Check Docker Logs**: If the container fails to start, check the logs:

```bash
docker logs <container_id>
```

2. **Ensure Dependencies are Installed**: If you encounter errors about missing packages, verify that the `requirements.txt` file is correctly copied into the Docker image and that `pip install` completes successfully during the Docker build.

---

## 🤝 **Contributing**

We encourage you to contribute and help improve this project! Here's how you can contribute:

1. Fork the repository.
2. Create a new branch for your changes.
3. Make the necessary changes and commit them.
4. Push your changes to your forked repository.
5. Open a pull request to merge your changes into the main repository.

---

### Happy Coding! 🎉

---

## **Streamlit Python Code for Spiral Visualization**

```python
import streamlit as st
import pandas as pd
import numpy as np
import altair as alt
from collections import namedtuple

# Define a namedtuple to store points in the spiral
Point = namedtuple('Point', ['x', 'y'])

# Function to generate the spiral data
def generate_spiral(num_points, num_turns):
    data = []
    for i in range(num_points):
        angle = 2 * np.pi * num_turns * (i / num_points)
        radius = i / num_points
        x = radius * np.cos(angle)
        y = radius * np.sin(angle)
        data.append(Point(x, y))
    return data

# Streamlit App Layout
st.title("Interactive Spiral Visualization")

# Sliders for user input
num_points = st.slider('Number of Points in Spiral', min_value=50, max_value=1000, value=500)
num_turns = st.slider('Number of Turns in Spiral', min_value=1, max_value=10, value=5)

# Generate the spiral data
spiral_data = generate_spiral(num_points, num_turns)

# Convert the spiral data to a DataFrame for visualization
spiral_df = pd.DataFrame(spiral_data, columns=['x', 'y'])

# Create the Altair chart to visualize the spiral
chart = alt.Chart(spiral_df).mark_circle(size=3).encode(
    x='x',
    y='y'
).properties(
    width=600,
    height=600
)

# Display the chart
st.altair_chart(chart, use_container_width=True)
```

---

## **Dockerfile**

```dockerfile
# Use official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt into the container
COPY requirements.txt .

# Install the dependencies
RUN pip install -r requirements.txt

# Copy the current directory contents into the container
COPY . .

# Expose the port for Streamlit
EXPOSE 8501

# Run the Streamlit app
CMD ["streamlit", "run", "app.py"]
```

---

## **requirements.txt**

```txt
streamlit
altair
pandas
```
