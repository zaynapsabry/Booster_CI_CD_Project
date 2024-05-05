# Use a Python base image
FROM python:3.6

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install required packages using pip
RUN pip3 install -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Make migrations for the database
RUN python3.6 manage.py makemigrations

# Apply the `
RUN python3.6 manage.py migrate

# Expose the port on which the server will run
EXPOSE 8000

# Start the Django server
CMD ["python3.6", "manage.py", "runserver", "0.0.0.0:8000"]
