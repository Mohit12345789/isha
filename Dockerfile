# Use RHEL UBI 9 Apache base image
FROM registry.access.redhat.com/ubi9/httpd-24

# Fix deprecated repo URLs
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Install wget and unzip, download and set up template
RUN dnf install -y wget unzip && \
    mkdir -p /var/www && \
    cd /var/www && \
    wget https://html5up.net/uploads/demos/solid-state.zip && \
    unzip solid-state.zip -d html && \
    mv html/solid-state/* html/ && \
    rm -rf solid-state.zip html/solid-state && \
    dnf clean all


EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
