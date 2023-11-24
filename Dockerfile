# Use an official Tomcat runtime as a base image
FROM tomcat:latest
RUN rm /usr/local/tomcat/conf/tomcat-users.xml
# Copy the webapp.war file into the webapps directory of Tomcat
COPY target/webapp-resume.war /usr/local/tomcat/webapps/
COPY tomcat-users.xml /usr/local/tomcat/conf/
WORKDIR /usr/local/tomcat

# Expose the default Tomcat port
EXPOSE 9093

# Start Tomcat when the container starts
CMD ["bin/catalina.sh", "run"]
