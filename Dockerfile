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
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.83/bin/apache-tomcat-9.0.83.zip
RUN unzip apache-tomcat-9.0.83.zip
RUN cd /opt/tomcat/apache-tomcat-9.0.83/bin
RUN yum -y install java
RUN java -version
RUN chmod u+x apache-tomcat-9.0.83/bin/*.sh
RUN rm /opt/tomcat/apache-tomcat-9.0.83/conf/tomcat-users.xml
COPY tomcat-users.xml /opt/tomcat/apache-tomcat-9.0.83/conf/
COPY target/webapp-resume.war /opt/tomcat/apache-tomcat-9.0.83/webapps/
COPY tomcat-users.xml /usr/local/tomcat/conf/
RUN sed -i '/<<Valve className="org.apache.catalina.valves.RemoteAddrValve"
allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />>/s/^/<!-- /' /opt/tomcat/apache-tomcat-9.0.83/webapps/manager/META-INF/context.xml && \
    sed -i '/<\/<Valve className="org.apache.catalina.valves.RemoteAddrValve"
allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />>/s/$/ -->/' /opt/tomcat/apache-tomcat-9.0.83/webapps/manager/META-INF/context.xml
RUN /opt/tomcat/apache-tomcat-9.0.83/bin/shutdown.sh && sleep 5 && /opt/tomcat/apache-tomcat-9.0.83/bin/startup.sh
CMD ["/opt/tomcat/apache-tomcat-9.0.83/bin/catalina.sh", "run"]
ExPOSE 9093
