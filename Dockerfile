# Use CentOS 7 base image
FROM centos:7

# Install Apache, wget, unzip
RUN yum install -y httpd wget unzip && \
    mkdir -p /var/www/html && \
    cd /var/www && \
    wget https://html5up.net/uploads/demos/solid-state.zip && \
    unzip solid-state.zip -d html && \
    mv html/solid-state/* html/ && \
    rm -rf html/solid-state solid-state.zip && \
    yum clean all

# Expose Apache port
EXPOSE 80

# Start Apache in foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
