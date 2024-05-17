# Use the official Tomcat image as the base image
FROM tomcat:8.0-alpine

CMD [“catalina.sh”, “run”]
# Remove the default ROOT webapp
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR file into the webapps directory of Tomcat
COPY target/webapp-resume.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 (the default port for Tomcat)
EXPOSE 8081

