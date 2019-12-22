# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
# https://medium.com/backticks-tildes/how-to-dockerize-a-django-application-a42df0cb0a99
FROM python:3.8

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# create root directory for our project in the container
RUN mkdir /hello_world

# Set the working directory to /hello_world
WORKDIR /hello_world

# Copy the current directory contents into the container at /hello_world
COPY . /hello_world/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
#RUN adduser -d user
#USER user