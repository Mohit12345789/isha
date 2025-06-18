FROM centos:latest

# Fix deprecated CentOS repo URLs
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Install necessary packages
RUN yum install -y httpd wget unzip -y

# Set working directory
WORKDIR /var/www/html

# Download Oberlo template from GitHub Pages
RUN wget https://themewagon.github.io/Oberlo/ -O index.html

# Expose HTTP port
EXPOSE 80

# Start Apache server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
