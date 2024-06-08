# Use the official Tomcat image as the base image
#FROM tomcat:8.0-alpine


# Remove the default ROOT webapp
#RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR file into the webapps directory of Tomcat
#COPY target/webapp-resume.war /usr/local/tomcat/webapps
#WORKDIR /usr/local/tomcat/webapps
#CMD [“catalina.sh”, “run”]
# Expose port 8080 (the default port for Tomcat)
#EXPOSE 8081

FROM centos
MAINTAINER Loki-1
RUN mkdir /opt/Tomcat
WORKDIR /opt/Tomcat
RUN curl -O https://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.69/bin/apache-tomcat-8.5.69.tar.gz
RUN tar -xvzf apache*.tar.gz
RUN mv apache-tomcat-8.5.69/* /opt/Tomcat
RUN yum install -y java
RUN yum install wget -y
RUN yum install vim -y
RUN java -version
WORKDIR /opt/Tomcat/webapps
COPY target/webapp-resume.war /opt/Tomcat/webapps/
EXPOSE 8081
CMD ["/opt/Tomcat/bin/startup.sh", "run"]
