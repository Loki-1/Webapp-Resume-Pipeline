# Use the official Tomcat image as the base image
FROM tomcat:latest

# Remove the default ROOT webapp
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR file into the webapps directory of Tomcat
COPY webapp-resume.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 (the default port for Tomcat)
EXPOSE 9093

