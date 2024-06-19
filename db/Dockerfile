# Use the official PostgreSQL image from the Docker Hub
FROM postgres:latest

# Set environment variables for PostgreSQL
ENV POSTGRES_DB=snm
ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=mypassword

# Copy initialization scripts if any
# ADD ./initdb /docker-entrypoint-initdb.d/

# Expose the PostgreSQL port
EXPOSE 5432

# Volume for PostgreSQL data
VOLUME ["/var/lib/postgresql/data"]

CMD ["postgres"]
