FROM centos:7

# Fix deprecated repo URLs
RUN yum install -y epel-release && \
    sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Base.repo && \
    yum clean all && yum makecache

# Install required packages
RUN yum install -y httpd git && \
    mkdir -p /var/www/html && \
    cd /var/www && \
    git clone https://github.com/themewagon/Oberlo.git && \
    mv Oberlo/* html/ && \
    rm -rf Oberlo && \
    yum clean all

# Expose Apache port
EXPOSE 80

# Start Apache server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
