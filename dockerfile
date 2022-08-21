FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install java -y --nogpgcheck
RUN yum install wget -y --nogpgcheck
RUN mkdir /data
RUN mkdir /data/tomcat
WORKDIR /data/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.82/bin/apache-tomcat-8.5.82.tar.gz .
RUN tar -xvzf /data/tomcat/apache-tomcat-8.5.82.tar.gz
RUN mv /data/tomcat/apache-tomcat-8.5.82/* /data/tomcat/
RUN rm -rf /data/tomcat/apache-tomcat-8.5.82.tar.gz
EXPOSE 8080
CMD [ "/data/tomcat/bin/catalina.sh", "run" ]
