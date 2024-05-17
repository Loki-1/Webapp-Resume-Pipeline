# Use the official Tomcat image as the base image
FROM tomcat:8.0-alpine


# Remove the default ROOT webapp
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR file into the webapps directory of Tomcat
COPY /var/lib/jenkins/tools/hudson.tasks.Maven_MavenInstallation/maven_3.6.1/target/maven-web-application.war  /usr/local/tomcat/webapps/ROOT.war
COPY  /usr/local/tomcat/webapps/ROOT.war

CMD [“catalina.sh”, “run”]
# Expose port 8080 (the default port for Tomcat)
EXPOSE 8081

