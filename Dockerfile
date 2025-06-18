FROM centos:7

# Fix deprecated repo URLs
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Install required packages and deploy HTML5UP Solid-State template
RUN yum install -y httpd wget unzip && \
    mkdir -p /var/www/html && \
    cd /var/www && \
    wget https://html5up.net/uploads/demos/solid-state.zip && \
    unzip html5up-solid-state.zip -d html && \
    mv html/html5up-solid-state/* html/ && \
    rm -rf html5up-solid-state.zip html/html5up-solid-state && \
    yum clean all

EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
