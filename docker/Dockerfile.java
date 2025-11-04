# Dockerfile for Java JEE Application (Tomcat)
FROM tomcat:10.1-jdk17-openjdk-slim

# Set working directory
WORKDIR /usr/local/tomcat

# Install curl and netcat for health checks
RUN apt-get update && \
    apt-get install -y curl netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

# Remove default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file to Tomcat webapps directory
COPY target/yours.war /usr/local/tomcat/webapps/ROOT.war

# Create logs directory
RUN mkdir -p /usr/local/tomcat/logs && \
    chmod -R 777 /usr/local/tomcat/logs

# Expose Tomcat port
EXPOSE 8080

# Set environment variables
ENV CATALINA_OPTS="-Xmx1024m -Xms512m -Djava.security.egd=file:/dev/./urandom"

# Set timezone
ENV TZ=Europe/Paris

# Start Tomcat with debug logging
CMD ["catalina.sh", "run"]
