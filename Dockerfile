# Use RHEL UBI 9 Apache base image
FROM centos:7

# Fix deprecated repo URLs
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Install git, wget, unzip
RUN dnf install -y git wget unzip && \
    mkdir -p /var/www/html && \
    cd /var/www && \
    git clone https://github.com/themewagon/Oberlo.git && \
    mv Oberlo/* html/ && \
    rm -rf Oberlo && \
    dnf clean all


EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
