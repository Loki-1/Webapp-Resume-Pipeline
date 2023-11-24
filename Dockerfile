# Use an official Tomcat runtime as a base image
FROM tomcat:latest

# Copy the webapp.war file into the webapps directory of Tomcat
COPY target/webapp-resume.war /usr/local/tomcat/webapps/
COPY /opt/tomcat-users.xml /usr/local/tomcat/conf/

# Expose the default Tomcat port
EXPOSE 9093

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
