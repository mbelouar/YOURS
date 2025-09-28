# Dockerfile for Java JEE Application (Tomcat)
FROM tomcat:10.1-jdk17-openjdk-slim

# Set working directory
WORKDIR /usr/local/tomcat

# Remove default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file to Tomcat webapps directory
# This will be mounted as a volume in docker-compose
COPY target/yours.war /usr/local/tomcat/webapps/ROOT.war

# Create logs directory
RUN mkdir -p /usr/local/tomcat/logs

# Expose Tomcat port
EXPOSE 8080

# Set environment variables
ENV CATALINA_OPTS="-Xmx1024m -Xms512m"

# Start Tomcat
CMD ["catalina.sh", "run"]
