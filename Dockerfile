# Use CentOS latest image
FROM centos:7

# Install Apache, wget, and unzip
RUN dnf install -y httpd wget unzip && \
    mkdir -p /var/www/html && \
    cd /var/www && \
    wget https://html5up.net/uploads/demos/solid-state.zip && \
    unzip solid-state.zip -d html && \
    mv html/solid-state/* html/ && \
    rm -rf html/solid-state solid-state.zip && \
    dnf clean all

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
