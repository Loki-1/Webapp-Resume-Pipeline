# Use an official Tomcat runtime as a base image
#FROM tomcat:latest  .    
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
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.87/bin/apache-tomcat-9.0.87.zip
RUN unzip apache-tomcat-9.0.87.zip
RUN cd /opt/tomcat/apache-tomcat-9.0.87/bin
RUN yum -y install java
RUN java -version
RUN chmod u+x apache-tomcat-9.0.87/bin/*.sh
RUN rm /opt/tomcat/apache-tomcat-9.0.87/conf/tomcat-users.xml
RUN sudo tee /opt/tomcat/apache-tomcat-9.0.87/conf/tomcat-users.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<tomcat-users xmlns="http://tomcat.apache.org/xml"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              xsi:schemaLocation="http://tomcat.apache.org/xml tomcat-users.xsd"
              version="1.0">
  <role rolename="probeuser" />
  <role rolename="poweruser" />
  <role rolename="poweruserplus" />
  <role rolename="manager" />
  <role rolename="manager-gui"/>
  <role rolename="manager-script"/>
  <role rolename="manager-jmx"/>
  <role rolename="manager-status"/>
  <role rolename="admin-gui"/>
  <role rolename="admin-script"/>
   <user username="tomcat" password="lokesh" roles="manager-gui,manager-script,manager-jmx,manager-status,admin-gui,admin-script"/>
</tomcat-users>
EOF
COPY target/webapp-resume.war /opt/tomcat/apache-tomcat-9.0.87/webapps/
RUN sed -i '/<Valve className="org.apache.catalina.valves.RemoteAddrValve"/s/^/<!-- /' /opt/tomcat/apache-tomcat-9.0.87/webapps/manager/META-INF/context.xml && \
    sed -i '/allow="127\\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1"/s/$/ -->/' /opt/tomcat/apache-tomcat-9.0.87/webapps/manager/META-INF/context.xml
RUN /opt/tomcat/apache-tomcat-9.0.87/bin/shutdown.sh && sleep 5 && /opt/tomcat/apache-tomcat-9.0.87/bin/startup.sh
CMD ["/opt/tomcat/apache-tomcat-9.0.87/bin/catalina.sh", "run"]
ExPOSE 9093
