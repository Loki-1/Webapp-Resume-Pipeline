# Use an official Tomcat runtime as a base image
#FROM tomcat:latest
#RUN rm /usr/local/tomcat/conf/tomcat-users.xml
# Copy the webapp.war file into the webapps directory of Tomcat
#COPY target/webapp-resume.war /usr/local/tomcat/webapps/
##COPY tomcat-users.xml /usr/local/tomcat/conf/
#WORKDIR /usr/local/tomcat

# Expose the default Tomcat port
#EXPOSE 9093

# Start Tomcat when the container starts
#CMD ["bin/catalina.sh", "run"]
FROM centos
MAINTAINER lokesh.naagam@gmail.com
WORKDIR /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN cd ../..
RUN yum install wget -y
RUN yum install unzip -y
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.82/bin/apache-tomcat-9.0.82.zip
RUN unzip apache-tomcat-9.0.82.zip
RUN cd /opt/tomcat/apache-tomcat-9.0.82/bin
RUN yum -y install java
RUN java -version
RUN chmod u+x apache-tomcat-9.0.82/bin/*.sh
COPY target/webapp-resume.war /opt/tomcat/apache-tomcat-9.0.82/webapps/
CMD ["/opt/tomcat/apache-tomcat-9.0.82/bin/catalina.sh", "run"]
ExPOSE 9093
