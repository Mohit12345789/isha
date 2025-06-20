FROM rockylinux:9

# Fix deprecated CentOS repo URLs
#RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    #sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Install necessary packages
RUN yum install -y httpd wget unzip -y 

# Set working directory
WORKDIR /var/www/html
RUN wget https://templatemo.com/download/templatemo_585_barber_shop && mv templatemo_585_barber_shop templatemo_585_barber_shop.zip
RUN unzip templatemo_585_barber_shop.zip
RUN cp -rvf templatemo_585_barber_shop/* .

# Expose HTTP port
EXPOSE 80

# Start Apache server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
