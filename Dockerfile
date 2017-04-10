# Base image
FROM python:3.5

# Install python packages
RUN pip install dj-database-url Django gunicorn psycopg2 whitenoise

# Set environment variables
ENV DJANGO_DEBUG 1
ENV DJANGO_ENABLE_SSL 0
ENV DJANGO_DB 1

# Expose port
EXPOSE 8000
