app.py

from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from Python in a Docker Container!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
	

requirements.txt
Flask


Dockerfile

# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container
COPY . .

# Expose port 5000 for the Flask application
EXPOSE 5000

# Define the command to run the application
CMD ["python", "app.py"]
	

docker build -t python-hello-app .


docker tag python-hello-app:latest arasutkv/mydocker:latest

docker push arasutkv/mydocker:latest