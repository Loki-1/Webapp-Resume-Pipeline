# Use an official Tomcat runtime as a base image
FROM tomcat:latest

# Copy the webapp.war file into the webapps directory of Tomcat
COPY webapp-resume.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
