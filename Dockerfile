# Base image
FROM python:3.5
MAINTAINER wallace123

# Install Postgresql
RUN apt-get update && apt-get install -y postgresql-9.4 postgresql-contrib-9.4

# Install python packages
RUN pip install dj-database-url Django gunicorn psycopg2 whitenoise

# Set up postgresql
USER postgres
RUN /etc/init.d/postgresql start \
    && psql --command "CREATE USER pguser WITH SUPERUSER PASSWORD 'pguser';" \
    && createdb -O pguser fnfldawgs
USER root
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.4/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.4/main/postgresql.conf
RUN mkdir -p /var/run/postgresql && chown -R postgres /var/run/postgresql
VOLUME ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# Set environment variables
ENV DJANGO_DEBUG 1
ENV DJANGO_ENABLE_SSL 0
ENV DJANGO_DB 1

# Expose ports
EXPOSE 8000
EXPOSE 5432

# Set working directory
WORKDIR /fnfldawgs
