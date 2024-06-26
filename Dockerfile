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
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz
RUN tar -xvzf apache*.tar.gz
RUN mv apache-tomcat-9.0.89/* /opt/Tomcat
RUN yum install -y java
RUN yum install wget -y
RUN yum install vim -y
RUN java -version
WORKDIR /opt/Tomcat/webapps
COPY target/webapp-resume.war /opt/Tomcat/webapps/
RUN curl -o /opt/Tomcat/conf/tomcat-users.xml https://raw.githubusercontent.com/Loki-1/Webapp-Resume-Pipeline/main/tomcat-users.xml
EXPOSE 9093
CMD ["/opt/Tomcat/bin/catalina.sh", "run"]
