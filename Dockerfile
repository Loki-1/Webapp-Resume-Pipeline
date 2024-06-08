# Use the official Tomcat image as the base image
FROM tomcat:8.0-alpine


# Remove the default ROOT webapp
RUN rm -rf /usr/local/tomcat/webapps/ROOT

WORKDIR /usr/local/tomcat/webapps
# Copy your WAR file into the webapps directory of Tomcat
COPY target/maven-web-application.war .
CMD [“catalina.sh”, “run”]
# Expose port 8080 (the default port for Tomcat)
EXPOSE 8081

