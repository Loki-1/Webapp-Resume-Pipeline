
FROM tomcat:latest  .    
COPY target/webapp-resume.war /usr/local/tomcat/webapps/
EXPOSE 9093
