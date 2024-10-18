# Use the official Python image as the base image taken frm docker hub
FROM python:3.9-buster

#Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt ./

# Install the required Python packages
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the application code to the workinf directory
COPY . ./

# Set the environmeent variables for the Flask app
ENV FLASK_RUN_HOST=0.0.0.0

# Expose the port on which the Flask app will run
EXPOSE 5000

# Start the Flask app when the container is running
CMD ["flask", "run"]

#run the docker file to get docker imaage(run docker build) and that imaage (docker image )is used to build docker container


# output is cpu amd memory utlization of docker desktop