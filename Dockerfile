# Use the official Tomcat 9 image from Docker Hub
FROM tomcat:9-jdk11-openjdk

# Set environment variables for the Tomcat server
ENV CATALINA_HOME=/usr/local/tomcat

# Add the WAR file to the Tomcat webapps directory
COPY target/CRUD.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 for the web application
EXPOSE 8080

# Start Tomcat server when the container is run
CMD ["catalina.sh", "run"]
