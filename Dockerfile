FROM rockylinux:8

# Fix deprecated CentOS repo URLs
#RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    #sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Install necessary packages

RUN yum install -y httpd wget unzip && yum clean all
WORKDIR /var/www/html
RUN wget https://templatemo.com/download/templatemo_591_villa_agency && mv templatemo_591_villa_agency templatemo_591_villa_agency.zip
#WORKDIR /var/www/html
RUN unzip templatemo_591_villa_agency.zip && cp -rf templatemo_591_villa_agency/* .
# Expose HTTP port
EXPOSE 80

# Start Apache server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]


#template 1
# wget https://templatemo.com/download/templatemo_589_lugx_gaming && mv templatemo_589_lugx_gaming templatemo_589_lugx_gaming.zip
# unzip templatemo_589_lugx_gaming.zip
# cp -rf templatemo_589_lugx_gaming/* .



#template 2
#wget https://templatemo.com/download/templatemo_591_villa_agency && mv templatemo_591_villa_agency templatemo_591_villa_agency.zip
#unzip templatemo_591_villa_agency.zip
#cp -rf templatemo_591_villa_agency/* .
